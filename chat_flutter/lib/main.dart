import 'dart:ui';

import 'package:chat_flutter/src/app/app_bloc_observer.dart';
import 'package:chat_flutter/src/inject/inject.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:chat_client/chat_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:logging/logging.dart';
import 'src/app/app.dart';
import 'src/app/logger/log_colors.dart';
import 'src/app/logger/logger_utils.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

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
  Bloc.observer = MyBlocObserver();
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(watchRecords);

  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrintStack(
      stackTrace: stack,
      label: '${red}PlatformDispatcher$reset$error',
    );
    return true;
  };

  FlutterError.onError = (details) {
    debugPrintStack(
      stackTrace: details.stack,
      label: '${red}FlutterError.onError$reset${details.exception}',
    );
  };
  usePathUrlStrategy();
  runApp(const App());
}
