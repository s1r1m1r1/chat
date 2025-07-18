import 'package:chat_flutter/src/user/domain/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'server_env_cubit.freezed.dart';

@injectable
class ServerEnvCubit extends Cubit<ServerEnvState> {
  final UserRepository _userRepository;
  ServerEnvCubit(this._userRepository) : super(const ServerEnvState.initial());

  Future<void> init() async {
    emit(ServerEnvState.loading());
    try {
      final envId = await _userRepository.getEnvId();

      emit(ServerEnvState.success(
        envId,
      ));
    } catch (e, stack) {
      emit(const ServerEnvState.failure());
      addError(e, stack);
    }
  }
}

@freezed
sealed class ServerEnvState with _$ServerEnvState {
  const ServerEnvState._();
  const factory ServerEnvState.initial() = $ServerEnvStateInitial;
  const factory ServerEnvState.loading() = $ServerEnvStateLoading;
  const factory ServerEnvState.success(int id) = $ServerEnvStateSuccess;
  const factory ServerEnvState.failure() = $ServerEnvStateFailure;
}
