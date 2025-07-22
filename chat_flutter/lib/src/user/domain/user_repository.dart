import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:injectable/injectable.dart';

abstract class UserRepository {
  FutureOr<int> getEnvId();
}

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Client _client;
  UserRepositoryImpl(this._client);
  int? _serverEnvId;
  UserInfo? _userInfo;

  @override
  FutureOr<int> getEnvId() async {
    if (_serverEnvId != null) return _serverEnvId!;
    final id = await _client.env.getId();
    _serverEnvId = id;
    return _serverEnvId!;
  }
}
