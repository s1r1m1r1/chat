import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void watchRecords(LogRecord rec) {
  // ---- filter --------
  if (rec.stackTrace != null) {
    debugPrintStack(
      stackTrace: rec.stackTrace,
      label: '${rec.level.color}:${rec.loggerName}: $red${rec.message}$reset',
    );
    return;
  }
  if (kDebugMode) {
    // reset level for all logger
    // Logger(Name.loggerName).level = Level.ALL;
  }
  debugPrint('\n${rec.level.color}:${rec.loggerName}: ${rec.message}');
}

extension LevelExt on Level {
  String get color => switch (this) {
        Level.ALL => '${cyan}ALL$reset',
        Level.FINE || Level.FINER || Level.FINEST => '${cyan}F$reset',
        Level.INFO => '${green}I$reset',
        Level.WARNING => '${red}W$reset',
        Level.SEVERE || Level.SHOUT => '${red}S$reset',
        Level.CONFIG => '${yellow}Config$reset',
        Level.OFF || _ => '',
      };
}

// not supported colors for iOS
final black = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[30m";
final red = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[31m";
final green = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[32m";
final yellow = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[33m";
final blue = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[34m";
final magenta = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[35m";
final cyan = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[36m";
final white = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[37m";
final reset = defaultTargetPlatform == TargetPlatform.iOS ? "" : "\x1B[0m";
