import 'package:injectable/injectable.dart';
import 'package:chat_client/chat_client.dart' show Client;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart' show FlutterAuthenticationKeyManager;
import 'package:serverpod_flutter/serverpod_flutter.dart' show FlutterConnectivityMonitor, localhost;

//  /\_/\
// ( o.o )
//  > ^ <

@module
abstract class ClientModule {
  @lazySingleton
  Client get someService => Client(
        'http://$localhost:8080/',
        authenticationKeyManager: FlutterAuthenticationKeyManager(),
      )..connectivityMonitor = FlutterConnectivityMonitor();
}
