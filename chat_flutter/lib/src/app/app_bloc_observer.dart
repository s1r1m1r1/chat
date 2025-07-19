import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

class MyTalkerBlocObserver extends TalkerBlocObserver {
  MyTalkerBlocObserver({
    super.talker,
    super.settings,
  });

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // debugPrintStack(
    //   stackTrace: stackTrace,
    //   label: error.toString(),
    // );
    super.onError(bloc, error, stackTrace);
  }
}
