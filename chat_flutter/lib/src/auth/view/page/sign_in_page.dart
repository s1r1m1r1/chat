// The _SignInPage either displays a dialog for signing in or, if the user is
// signed in, displays the _ConnectionPage.
import 'package:chat_flutter/main.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../chat/view/cubit/list_chat_controller_cubit.dart';
import '../../../inject/inject.dart';
import '../../../main_page.dart';
import '../../../user/view/bloc/server_env_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
    sessionManager.addListener(_changedSessionStatus);
  }

  @override
  void dispose() {
    super.dispose();
    client.removeStreamingConnectionStatusListener(_changedSessionStatus);
  }

  @override
  Widget build(BuildContext context) {
    if (sessionManager.isSignedIn) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => getIt<ServerEnvCubit>()..init(),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => getIt<ListChatControllerCubit>()..load(),
          ),
        ],
        child: BlocBuilder<ListChatControllerCubit, ListChatControllerState>(
          builder: (context, listChatControllerState) {
            return Builder(
              builder: (context) {
                switch (listChatControllerState) {
                  case $InitialListChatController():
                    return _loading(context, "Init 2");
                  case $LoadingListChatController():
                    return _loading(context, "L 2");
                  case $FailureListChatController():
                    return _loading(context, "F 2");
                  case $LoadedListChatController():
                    return MainPage(
                      chatControllers: listChatControllerState.result,
                    );
                }
              },
            );
          },
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Center(
            child: SignInWithEmailButton(
              caller: client.modules.auth,
            ),
          ),
        ),
      );
    }
  }

  Widget _loading(
    BuildContext ctx, [
    String? message,
  ]) {
    return Material(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != null) Text(message),
          CircularProgressIndicator(),
          TextButton(
              onPressed: () async {
                // await ctx.read<ConnectionCubit>().subscribe();
                if (!ctx.mounted) return;
                await ctx.read<ServerEnvCubit>().init();
                if (!ctx.mounted) return;
                await ctx.read<ListChatControllerCubit>().load();
                if (!ctx.mounted) return;
              },
              child: Text('Retry'))
        ],
      )),
    );
  }

  // This method is called whenever the user signs in or out.
  void _changedSessionStatus() {
    setState(() {});
  }
}

// The _ConnectionPage can display three states; a loading spinner, a page
// if loading fails or if the connection to the server is broken, or the
// main chat page.
