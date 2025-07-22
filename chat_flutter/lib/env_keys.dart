import 'package:flutter/foundation.dart';

String get googleClientId {
  if (kIsWeb) {
    // Access the value defined with --dart-define in launch.json
    return const String.fromEnvironment('GOOGLE_WEB_CLIENT_ID', defaultValue: 'YOUR_WEB_CLIENT_ID_FALLBACK');
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    return const String.fromEnvironment('GOOGLE_ANDROID_CLIENT_ID', defaultValue: 'YOUR_ANDROID_CLIENT_ID_FALLBACK');
  }
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return const String.fromEnvironment('GOOGLE_APPLE_CLIENT_ID', defaultValue: 'YOUR_APPLE_CLIENT_ID_FALLBACK');
  }
  throw Exception('Unsupported platform');
}
