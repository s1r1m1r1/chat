import 'package:flutter/foundation.dart';

final googleWebClientId = r"883257193716-7pp3vt05kc38nidb3vo98jq18k5m8v8q.apps.googleusercontent.com";

final googleAppleClientId = r"883257193716-ncebu04s8qc13cm298795976e5rbm2vm.apps.googleusercontent.com";
final googleAndroidClientID = r"883257193716-f9skv2m4d4qhi72oviuiee8m9da5o31d.apps.googleusercontent.com";
String get googleClientId {
  if (kIsWeb) return googleWebClientId;
  if (defaultTargetPlatform == TargetPlatform.android) return googleAndroidClientID;
  if (defaultTargetPlatform == TargetPlatform.iOS) return googleAppleClientId;
  throw Exception('Unsupported platform');
}
