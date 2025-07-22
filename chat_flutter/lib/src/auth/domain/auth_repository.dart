import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

import 'auth_status.dart';

abstract class AuthRepository {
  void init();
  void dispose();

  AuthStatus get authStatus;
  Stream<AuthStatus> get authStatusStream;
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final SessionManager _sessionManager;
  AuthRepositoryImpl(this._sessionManager) {
    init();
  }

  final _authStatusSbj = BehaviorSubject<AuthStatus>.seeded(AuthStatus.loggedOut);

  @override
  void init() {
    _sessionManager.addListener(_onChangeSessionStatus);
  }

  @override
  Stream<AuthStatus> get authStatusStream => _authStatusSbj.stream;

  void _onChangeSessionStatus() {
    _authStatusSbj.value = _sessionManager.isSignedIn ? AuthStatus.loggedIn : AuthStatus.loggedOut;
  }

  @override
  @disposeMethod
  void dispose() {
    _sessionManager.removeListener(_onChangeSessionStatus);
  }

  @override
  AuthStatus get authStatus => _authStatusSbj.value;
}
