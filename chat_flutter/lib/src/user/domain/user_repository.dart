import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:injectable/injectable.dart';

import '../data/user_datasource.dart';

abstract class UserRepository {
  FutureOr<int> getEnvId();
}

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final _datasource = UserDatasource();
  int? _serverEnvId;
  UserInfo? _userInfo;

  @override
  FutureOr<int> getEnvId() async {
    if (_serverEnvId != null) return _serverEnvId!;
    final id = await _datasource.getEnvId();
    _serverEnvId = id;
    return _serverEnvId!;
  }
}
