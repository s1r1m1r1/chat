import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'logger/log_colors.dart';

///  /\_/\
/// ( o.o )
///  > ^ <

class MyBlocObserver extends BlocObserver {
  static const String loggerName = 'BlocObserver';
  MyBlocObserver();
  late final _logger = Logger(loggerName);

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.fine(': ${bloc.runtimeType}:\nevent: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe(': ${bloc.runtimeType}:\n${red}err$reset:', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   _logger.info(': ${bloc.runtimeType}:\nstate: ${change.nextState}');
  //   super.onChange(bloc, change);
  // }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.info('${bloc.runtimeType}:\n'
        'event: ${transition.event}\n'
        'state: ${transition.nextState}');
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
  }
}
