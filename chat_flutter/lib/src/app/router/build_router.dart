import 'package:chat_flutter/src/app/router/routes.dart';
import 'package:chat_flutter/src/auth/domain/auth_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../auth/view/bloc/auth_cubit.dart';

GoRouter buildRouter(BuildContext context) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
    initialLocation: SignInRoute.path,
    refreshListenable: context.read<AuthCubit>(),
    redirect: (context, state) {
      final authStatus = context.read<AuthCubit>().state;
      debugPrint('\n'
          'path: ${state.uri.path}');
      if (authStatus == AuthStatus.loggedIn) {
        if (state.uri.path == SignInRoute.path) {
          return HomeRoute.path;
        }
        return null;
      } else {
        return SignInRoute.path;
      }
    },
  );
}
