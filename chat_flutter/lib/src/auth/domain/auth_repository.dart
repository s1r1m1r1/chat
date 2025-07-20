import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../main.dart';
import 'auth_status.dart';

abstract class AuthRepository {
  void init();
  void dispose();

  Stream<AuthStatus> get authStatusStream;
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl() {
    init();
  }

  final _authStatusSbj = BehaviorSubject<AuthStatus>.seeded(AuthStatus.loggedOut);

  @override
  void init() {
    sessionManager.addListener(_onChangeSessionStatus);
  }

  @override
  Stream<AuthStatus> get authStatusStream => _authStatusSbj.stream;

  void _onChangeSessionStatus() {
    _authStatusSbj.value = sessionManager.isSignedIn ? AuthStatus.loggedIn : AuthStatus.loggedOut;
  }

  @override
  @disposeMethod
  void dispose() {
    sessionManager.removeListener(_onChangeSessionStatus);
  }
}
