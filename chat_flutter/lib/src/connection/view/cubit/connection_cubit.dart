import 'dart:async';

import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'connection_cubit.freezed.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final ConnectionRepository _connectionRepository;
  ConnectionCubit(this._connectionRepository)
      : super(ConnectionState.initial());
  StreamSubscription? _streamSubscription;

  void subscribe() {
    _streamSubscription = Rx.combineLatest2(
        _connectionRepository.internetStatus,
        _connectionRepository.serverStatus, (internet, server) {
      if (internet == InternetStatus.available) {
        if (server == ServerStatus.connected) {
          return ConnectionState.connected();
        } else if (server == ServerStatus.disconnected) {
          return ConnectionState.disconnected();
        } else {
          return ConnectionState.connecting();
        }
      } else {
        return ConnectionState.disconnected();
      }
    }).listen((state) {
      emit(state);
    });
    _connectionRepository.internetStatus.listen((event) {});
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

@Freezed(
  copyWith: true,
)
sealed class ConnectionState with _$ConnectionState {
  const ConnectionState._();

  const factory ConnectionState.initial() = $InitialState;
  const factory ConnectionState.connecting() = $ConnectingState;
  const factory ConnectionState.connected() = $ConnectedState;
  const factory ConnectionState.disconnected() = $DisconnectedState;
}
