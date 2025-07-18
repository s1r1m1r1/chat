import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ChannelsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Channel>> getChannels(Session session) async {
    return await Channel.db.find(session);
  }
}
