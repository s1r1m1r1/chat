import 'package:chat_flutter/src/app/app_bloc_observer.dart';
import 'package:chat_flutter/src/chat/view/cubit/list_chat_controller_cubit.dart';
import 'package:chat_flutter/src/connection/view/cubit/connection_cubit.dart';
import 'package:chat_flutter/src/inject/inject.dart';
import 'package:chat_flutter/src/main_page.dart';
import 'package:chat_flutter/src/user/view/bloc/server_env_cubit.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:chat_client/chat_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'src/app/app_material.dart';
import 'src/connection/domain/connection_repository.dart';

late SessionManager sessionManager;
late Client client;

void main() async {
  // Need to call this as SessionManager is using Flutter bindings before runApp
  // is called.
  WidgetsFlutterBinding.ensureInitialized();

  // Sets up a singleton client object that can be used to talk to the server
  // from anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  client = Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();
  configureDependencies();
  Bloc.observer = MyTalkerBlocObserver(
    settings: TalkerBlocLoggerSettings(
      enabled: true,
      printEventFullData: false,
      printStateFullData: false,
      printChanges: true,
      printClosings: true,
      printCreations: true,
      printEvents: true,
      printTransitions: true,
      // If you want log only AuthBloc transitions
      transitionFilter: (bloc, transition) =>
          bloc.runtimeType.toString() == 'AuthBloc',
      // If you want log only AuthBloc events
      eventFilter: (bloc, event) => bloc.runtimeType.toString() == 'AuthBloc',
    ),
  );
  runApp(const App());
}

// The _SignInPage either displays a dialog for signing in or, if the user is
// signed in, displays the _ConnectionPage.
class SignInPage extends StatefulWidget {
  const SignInPage();

  @override
  _SignInPageState createState() => _SignInPageState();
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
            create: (_) => getIt<ConnectionCubit>()..subscribe(),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => getIt<ServerEnvCubit>()..init(),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => getIt<ListChatControllerCubit>()..load(),
          ),
        ],
        child: BlocListener<ConnectionCubit, ConnectionState>(
          listener: (context, connectionState) async {
            final message = switch ((
              connectionState.internetStatus,
              connectionState.serverStatus
            )) {
              (InternetStatus.available, ServerStatus.connecting) =>
                'connecting...',
              (InternetStatus.available, ServerStatus.disconnected) =>
                'disconnected',
              (InternetStatus.available, ServerStatus.waitingToRetry) =>
                'waiting to retry',
              (InternetStatus.available, ServerStatus.connecting) =>
                'connecting...',
              InternetStatus.noInternet => 'no internet',
              (_, _) => throw UnimplementedError(),
            };
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(message)),
              );
          },
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

class RetryButton extends StatelessWidget {
  const RetryButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text('retry button'),
    );
  }
}
