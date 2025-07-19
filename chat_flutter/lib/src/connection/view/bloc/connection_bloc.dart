import 'dart:async';
import 'dart:math'; // For pow function

import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart' show debugPrint; // For debugPrint

// Assuming InternetStatus and ServerStatus are imported or defined
// from connection_repository.dart

part 'connection_bloc.freezed.dart'; // Make sure this points to your bloc's freezed file

@injectable
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final ConnectionRepository _connectionRepository;

  StreamSubscription? _internetStatusSubscription;
  StreamSubscription? _serverStatusSubscription;

  // Internal state for reconnect logic (now managed by the Bloc)
  Timer? _reconnectTimer;
  int _reconnectAttempt = 0;
  static const int _maxReconnectAttempts = 10;
  static const Duration _reconnectDelay = Duration(seconds: 5);

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
    on<_Reconnect>(_onReconnect); // Handler for the new reconnect event
  }

  void _onEvent(ConnectionEvent event, Emitter<ConnectionState> emit) {
    debugPrint('ConnectionBloc Event: $event');
  }

  Future<void> _onSubscribe(
      _Subscribe event, Emitter<ConnectionState> emit) async {
    await _internetStatusSubscription?.cancel();
    await _serverStatusSubscription?.cancel();

    _internetStatusSubscription = _connectionRepository.internetStatus.listen(
      (status) => add(ConnectionEvent.internetStatusChanged(status)),
    );

    _serverStatusSubscription = _connectionRepository.serverStatus.listen(
      (status) => add(ConnectionEvent.serverStatusChanged(status)),
    );

    // After subscribing, immediately check current status and potentially connect
    // This is important for the initial state when the app starts
    final currentInternetStatus =
        await _connectionRepository.getCurrentInternetStatus();
    final currentServerStatus =
        await _connectionRepository.getCurrentServerStatus();

    // Trigger status changes based on current states
    add(ConnectionEvent.internetStatusChanged(currentInternetStatus));
    add(ConnectionEvent.serverStatusChanged(currentServerStatus));

    // If server is not connected initially, start the process
    if (currentServerStatus != ServerStatus.connected) {
      add(const ConnectionEvent.reconnect());
    }
  }

  void _onInternetStatusChanged(
      _InternetStatusChanged event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(internetStatus: event.status));
    // If internet becomes available and server is not connected,
    // immediately try to reconnect and reset attempts.
    if (event.status == InternetStatus.available &&
        state.serverStatus != ServerStatus.connected &&
        state.serverStatus != ServerStatus.connecting &&
        state.serverStatus != ServerStatus.failed) {
      // Don't try if already connecting
      debugPrint('Internet became available. Triggering immediate reconnect.');
      add(const ConnectionEvent.reconnect());
    }
  }

  void _onServerStatusChanged(
      _ServerStatusChanged event, Emitter<ConnectionState> emit) {
    emit(state.copyWith(serverStatus: event.status));

    // If server becomes connected, cancel any reconnect timer
    if (event.status == ServerStatus.connected) {
      _cancelReconnectTimer();
      _reconnectAttempt = 0;
      emit(state.copyWith(nextRetryDelay: null)); // Clear retry delay
    }
    // If server disconnects or fails, trigger a reconnect
    else if (event.status == ServerStatus.disconnected ||
        event.status == ServerStatus.failed) {
      add(const ConnectionEvent.reconnect());
    }
  }

  Future<void> _onRetryConnection(
      _RetryConnection event, Emitter<ConnectionState> emit) async {
    _cancelReconnectTimer(); // Cancel any ongoing automatic retry
    _reconnectAttempt = 0; // Reset retry count for manual attempt
    emit(state.copyWith(nextRetryDelay: null)); // Clear retry delay
    add(const ConnectionEvent
        .reconnect()); // Trigger an immediate connection attempt
  }

  Future<void> _onReconnect(
      _Reconnect event, Emitter<ConnectionState> emit) async {
    // Only proceed if not already connecting and internet is available
    if (state.serverStatus == ServerStatus.connecting) return;
    emit(state.copyWith(isReconnecting: true));

    _cancelReconnectTimer(); // Ensure only one timer is active

    if (_reconnectAttempt >= _maxReconnectAttempts) {
      emit(state.copyWith(
          isReconnecting: false,
          serverStatus: ServerStatus.disconnected,
          nextRetryDelay: null));
      return;
    }

    _reconnectAttempt++;
    emit(state.copyWith(isReconnecting: true, nextRetryDelay: _reconnectDelay));

    _reconnectTimer = Timer(_reconnectDelay, () {
      add(const ConnectionEvent
          .reconnect()); // Trigger a new reconnect cycle (which will try to connect)
    });
    try {
      await _connectionRepository
          .openStreamingConnection()
          .timeout(Duration(seconds: 10));
    } catch (e) {
      _connectionRepository.closeStreamingConnection();
      emit(state.copyWith(
          serverStatus: ServerStatus.failed, nextRetryDelay: null));
      return;
    }
  }

  void _cancelReconnectTimer() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  @override
  Future<void> close() {
    _cancelReconnectTimer();
    _internetStatusSubscription?.cancel();
    _serverStatusSubscription?.cancel();
    return super.close();
  }
}

// connection_bloc.freezed.dart (after regeneration) or in your connection_bloc.dart before the Bloc class:wa

@freezed
abstract class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.subscribe() = _Subscribe;
  const factory ConnectionEvent.internetStatusChanged(InternetStatus status) =
      _InternetStatusChanged;
  const factory ConnectionEvent.serverStatusChanged(ServerStatus status) =
      _ServerStatusChanged;
  const factory ConnectionEvent.retryConnection() =
      _RetryConnection; // Manual retry
  const factory ConnectionEvent.reconnect() =
      _Reconnect; // Automatic reconnect trigger
}

// connection_bloc.freezed.dart (after regeneration) or in your connection_bloc.dart before the Bloc class
@Freezed(
  copyWith: true,
)
abstract class ConnectionState with _$ConnectionState {
  const ConnectionState._();

  const factory ConnectionState({
    required InternetStatus internetStatus,
    required ServerStatus serverStatus,
    @Default(false) bool isReconnecting,
    Duration? nextRetryDelay,
  } // Added for visibility of next retry
      ) = _ConnectionState;
}
