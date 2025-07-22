import 'package:chat_flutter/src/app/app_bloc_observer.dart';
import 'package:chat_flutter/src/inject/inject.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'src/app/app.dart';
import 'src/app/logger/log_colors.dart';
import 'src/app/logger/logger_utils.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

//  /\_/\
// ( o.o )
//  > ^ <
//  LETS START
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
  // no # hash for web , and with # on native
  usePathUrlStrategy();
  runApp(const App());
}
