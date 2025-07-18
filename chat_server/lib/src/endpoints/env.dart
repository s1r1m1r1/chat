import 'package:chat_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EnvEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// return id
  Future<int> getId(
    Session session,
  ) async {
    final userId = (await session.authenticated)?.userId;

    final options = await UserOption.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (options.isEmpty) {
      final r = await UserOption.db.insertRow(
        session,
        UserOption(
          userId: userId!,
        ),
      );
      return r.byIndexEnv.index;
      // throw Exception('UserOption not found');
    }
    return options.first.byIndexEnv.index;
  }
}
