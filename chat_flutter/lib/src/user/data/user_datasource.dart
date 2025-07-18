import 'package:chat_flutter/main.dart';

class UserDatasource {
  Future<int> getEnvId() {
    return client.env.getId();
  }
}
