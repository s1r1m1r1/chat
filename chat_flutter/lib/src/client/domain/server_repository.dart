import 'package:injectable/injectable.dart';

abstract class ServerRepository {
  Future<void> init();
  Future<void> dispose();
}

@LazySingleton(as: ServerRepository)
class ServerRepositoryImpl extends ServerRepository {
  @override
  Future<void> init() async {}

  @disposeMethod
  @override
  Future<void> dispose() async {}
}
