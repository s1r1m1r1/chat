import 'package:chat_client/chat_client.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

//  /\_/\
// ( o.o )
//  > ^ <

@module
abstract class SessionManagerModule {
  @preResolve
  @lazySingleton
  Future<SessionManager> sessionManager(Client client) async {
    final s = SessionManager(
      caller: client.modules.auth,
    );
    await s.initialize();
    return s;
  }
}
