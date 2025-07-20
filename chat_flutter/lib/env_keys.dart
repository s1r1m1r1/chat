import 'package:flutter/foundation.dart';

final googleWebClientId = r"883257193716-7pp3vt05kc38nidb3vo98jq18k5m8v8q.apps.googleusercontent.com";

final googleAppleClientId = r"883257193716-ncebu04s8qc13cm298795976e5rbm2vm.apps.googleusercontent.com";
String get googleClientId => defaultTargetPlatform == TargetPlatform.iOS ? googleAppleClientId : googleClientId;
