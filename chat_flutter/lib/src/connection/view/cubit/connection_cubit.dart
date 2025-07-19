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
      : super(ConnectionState(
            InternetStatus.noInternet, ServerStatus.disconnected));
  StreamSubscription? _streamSubscription;

  void subscribe() {
    _streamSubscription = Rx.combineLatest2(
            _connectionRepository.internetStatus,
            _connectionRepository.serverStatus,
            ConnectionState.new)
        .listen((state) {
      emit(state);
    });
    _connectionRepository.internetStatus.listen((event) {});
  }

  Future<void> retryConnection() async {
    try {
      print('retryConnection');
      await _connectionRepository.retryConnection();
    } catch (e) {
      addError(e);
    }
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
abstract class ConnectionState with _$ConnectionState {
  const ConnectionState._();

  const factory ConnectionState(
          InternetStatus internetStatus, ServerStatus serverStatus) =
      $ConnectingState;
}
