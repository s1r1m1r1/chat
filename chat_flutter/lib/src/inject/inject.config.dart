// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_flutter/src/auth/domain/auth_repository.dart' as _i943;
import 'package:chat_flutter/src/auth/view/bloc/auth_cubit.dart' as _i201;
import 'package:chat_flutter/src/chat/domain/chat_repository.dart' as _i513;
import 'package:chat_flutter/src/chat/view/cubit/list_chat_controller_cubit.dart'
    as _i320;
import 'package:chat_flutter/src/connection/domain/connection_repository.dart'
    as _i504;
import 'package:chat_flutter/src/connection/view/bloc/connection_bloc.dart'
    as _i480;
import 'package:chat_flutter/src/server/domain/server_repository.dart' as _i73;
import 'package:chat_flutter/src/user/domain/user_repository.dart' as _i470;
import 'package:chat_flutter/src/user/view/bloc/server_env_cubit.dart' as _i189;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i73.ServerRepository>(
      () => _i73.ServerRepositoryImpl(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i470.UserRepository>(() => _i470.UserRepositoryImpl());
    gh.lazySingleton<_i504.ConnectionRepository>(
      () => _i504.ConnectionRepositoryImpl(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i943.AuthRepository>(
      () => _i943.AuthRepositoryImpl(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i480.ConnectionBloc>(
        () => _i480.ConnectionBloc(gh<_i504.ConnectionRepository>()));
    gh.factory<_i201.AuthCubit>(
        () => _i201.AuthCubit(gh<_i943.AuthRepository>()));
    gh.lazySingleton<_i513.ChatRepository>(
      () => _i513.ChatRepositoryImpl(gh<_i470.UserRepository>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i189.ServerEnvCubit>(
        () => _i189.ServerEnvCubit(gh<_i470.UserRepository>()));
    gh.factory<_i320.ListChatControllerCubit>(
        () => _i320.ListChatControllerCubit(gh<_i513.ChatRepository>()));
    return this;
  }
}
