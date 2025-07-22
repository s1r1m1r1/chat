import 'package:flutter/foundation.dart';

String? get googleClientId {
  if (kIsWeb) return null;
  if (defaultTargetPlatform == TargetPlatform.android) {
    return const String.fromEnvironment('GOOGLE_ANDROID_CLIENT_ID');
  }
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return const String.fromEnvironment('GOOGLE_APPLE_CLIENT_ID');
  }
  throw Exception('Unsupported platform');
}
