import 'dart:async';

import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart' show debugPrint; // For debugPrint

import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'connection_bloc.freezed.dart'; // Make sure this points to your bloc's freezed file

@injectable
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final ConnectionRepository _connectionRepository;

  StreamSubscription? _internetStatusSubscription;
  StreamSubscription? _serverStatusSubscription;

  static const int _maxReconnectAttempts = 7;
  static const Duration _reconnectDelay = Duration(seconds: 3);

  ConnectionBloc(this._connectionRepository)
      : super(const ConnectionState(
          internetStatus: InternetStatus.noInternet,
          serverStatus: ServerStatus.disconnected,
        )) {
    on<ConnectionEvent>(_onEvent); // General event logger/router

    on<_Subscribe>(_onSubscribe);
    on<_InternetStatusChanged>(_onInternetStatusChanged);
    on<_ServerStatusChanged>(_onServerStatusChanged);
    on<_RetryConnection>(_onRetryConnection);
    // sequential events
    on<_Reconnect>(_onReconnect, transformer: sequential()); // Handler for the new reconnect event
  }

  void _onEvent(ConnectionEvent event, Emitter<ConnectionState> emit) {
    debugPrint('ConnectionBloc Event: $event');
  }

  Future<void> _onSubscribe(_Subscribe event, Emitter<ConnectionState> emit) async {
    await _internetStatusSubscription?.cancel();
    await _serverStatusSubscription?.cancel();

    _internetStatusSubscription = _connectionRepository.internetStatus.listen(
      (status) => add(ConnectionEvent.internetStatusChanged(status)),
    );

    _serverStatusSubscription = _connectionRepository.serverStatus.listen(
      (status) => add(ConnectionEvent.serverStatusChanged(status)),
    );
    final currentInternetStatus = await _connectionRepository.getCurrentInternetStatus();
    final currentServerStatus = await _connectionRepository.getCurrentServerStatus();
    add(ConnectionEvent.internetStatusChanged(currentInternetStatus));
    add(ConnectionEvent.serverStatusChanged(currentServerStatus));
    if (currentServerStatus != ServerStatus.connected) {
      add(const ConnectionEvent.retryConnection());
    }
  }

  void _onInternetStatusChanged(_InternetStatusChanged event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(internetStatus: event.status));
    if (event.status == InternetStatus.available &&
        state.serverStatus != ServerStatus.connected &&
        state.serverStatus != ServerStatus.connecting) {
      add(const ConnectionEvent.retryConnection());
    }
  }

  void _onServerStatusChanged(_ServerStatusChanged event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(serverStatus: event.status)); // Clear retry delay
    if (event.status == ServerStatus.disconnected) {
      add(const ConnectionEvent.retryConnection());
    }
  }

  Future<void> _onRetryConnection(_RetryConnection event, Emitter<ConnectionState> emit) async {
    if (!state.isReconnecting) {
      emit(state.copyWith(reconnectAttempt: 0)); // Clear retry delay
    }
    emit(state.copyWith(isReconnecting: true)); // Clear retry delay
    add(const ConnectionEvent.reconnect()); // Trigger an immediate connection attempt
  }

  Future<void> _onReconnect(_Reconnect event, Emitter<ConnectionState> emit) async {
    if (!state.isReconnecting || state.serverStatus == ServerStatus.connected) {
      emit(state.copyWith(isReconnecting: false));
      return;
    }
    emit(state.copyWith(reconnectAttempt: state.reconnectAttempt + 1));

    try {
      // 0 <-> 5 seconds
      await _connectionRepository.openStreamingConnection().timeout(Duration(seconds: 5));
    } catch (e) {
      _connectionRepository.closeStreamingConnection();
    }
    // + seconds delayed
    await Future.delayed(_reconnectDelay);
    if (state.reconnectAttempt >= _maxReconnectAttempts) {
      emit(state.copyWith(isReconnecting: false, serverStatus: ServerStatus.waitingToRetry));
    } else {
      add(const ConnectionEvent.reconnect());
    }
  }

  @override
  Future<void> close() {
    _internetStatusSubscription?.cancel();
    _serverStatusSubscription?.cancel();
    return super.close();
  }
}

// connection_bloc.freezed.dart (after regeneration) or in your connection_bloc.dart before the Bloc class:wa

@Freezed(copyWith: false)
abstract class ConnectionEvent with _$ConnectionEvent {
  const ConnectionEvent._();
  const factory ConnectionEvent.subscribe() = _Subscribe;
  const factory ConnectionEvent.internetStatusChanged(InternetStatus status) = _InternetStatusChanged;
  const factory ConnectionEvent.serverStatusChanged(ServerStatus status) = _ServerStatusChanged;
  const factory ConnectionEvent.retryConnection() = _RetryConnection; // Manual retry
  const factory ConnectionEvent.reconnect() = _Reconnect; // Automatic reconnect trigger
}

@Freezed(copyWith: true)
abstract class ConnectionState with _$ConnectionState {
  const ConnectionState._();

  const factory ConnectionState({
    required InternetStatus internetStatus,
    required ServerStatus serverStatus,
    @Default(false) bool isReconnecting,
    @Default(0) int reconnectAttempt,
  } // Added for visibility of next retry
      ) = _ConnectionState;
}
