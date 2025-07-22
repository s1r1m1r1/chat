// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_client/chat_client.dart' as _i267;
import 'package:chat_flutter/src/auth/domain/auth_repository.dart' as _i943;
import 'package:chat_flutter/src/auth/view/bloc/auth_cubit.dart' as _i201;
import 'package:chat_flutter/src/chat/domain/chat_repository.dart' as _i513;
import 'package:chat_flutter/src/chat/view/cubit/list_chat_controller_cubit.dart'
    as _i320;
import 'package:chat_flutter/src/client/data/client_module.dart' as _i762;
import 'package:chat_flutter/src/client/data/session_manager_module.dart'
    as _i742;
import 'package:chat_flutter/src/client/domain/server_repository.dart' as _i756;
import 'package:chat_flutter/src/user/domain/user_repository.dart' as _i470;
import 'package:chat_flutter/src/user/view/bloc/server_env_cubit.dart' as _i189;
import 'package:chat_flutter/src/ws_connection/domain/ws_connection_repository.dart'
    as _i190;
import 'package:chat_flutter/src/ws_connection/view/bloc/ws_connection_bloc.dart'
    as _i270;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart'
    as _i144;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart'
    as _i584;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final clientModule = _$ClientModule();
    final sessionManagerModule = _$SessionManagerModule();
    gh.lazySingleton<_i267.Client>(() => clientModule.someService);
    gh.lazySingleton<_i190.WsConnectionRepository>(
      () => _i190.WSConnectionRepositoryImpl(gh<_i267.Client>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i756.ServerRepository>(
      () => _i756.ServerRepositoryImpl(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i470.UserRepository>(
        () => _i470.UserRepositoryImpl(gh<_i267.Client>()));
    await gh.lazySingletonAsync<_i144.SessionManager>(
      () => sessionManagerModule.sessionManager(gh<_i267.Client>()),
      preResolve: true,
    );
    gh.factory<_i189.ServerEnvCubit>(
        () => _i189.ServerEnvCubit(gh<_i470.UserRepository>()));
    gh.factory<_i270.WsConnectionBloc>(
        () => _i270.WsConnectionBloc(gh<_i190.WsConnectionRepository>()));
    gh.lazySingleton<_i943.AuthRepository>(
      () => _i943.AuthRepositoryImpl(gh<_i144.SessionManager>()),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i201.AuthCubit>(
        () => _i201.AuthCubit(gh<_i943.AuthRepository>()));
    gh.lazySingleton<_i513.ChatRepository>(
      () => _i513.ChatRepositoryImpl(
        gh<_i470.UserRepository>(),
        gh<_i943.AuthRepository>(),
        gh<_i267.Client>(),
        gh<_i584.SessionManager>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i320.ListChatControllerCubit>(
        () => _i320.ListChatControllerCubit(gh<_i513.ChatRepository>()));
    return this;
  }
}

class _$ClientModule extends _i762.ClientModule {}

class _$SessionManagerModule extends _i742.SessionManagerModule {}
