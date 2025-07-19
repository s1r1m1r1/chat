import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class MyBlocObserver extends BlocObserver {
  static const String loggerName = 'MyBlocObserver';
  MyBlocObserver();
  late final _logger = Logger(loggerName);

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.fine('\nonEvent: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe('\nonError:', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.info('\nonChange: nextState ${change.nextState}');
    super.onChange(bloc, change);
  }
}
