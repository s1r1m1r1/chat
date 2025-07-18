import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class AdminEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  @override
  Set<Scope> get requiredScopes => {Scope.admin};

  Future<Channel> createChannel(Session session,
      {required String name, required String channel}) async {
    // Get a list of all channels from the database
    final cannel = Channel(name: name, channel: channel);
    final channelWithId = await Channel.db.updateRow(session, cannel);
    return channelWithId;
  }

  Future<Channel> deleteChannel(Session session, int channelId) async {
    final channel = await Channel.db.findById(session, channelId);
    if (channel == null) {
      throw Exception('Recipe not found');
    }

    session.log('Remove recipe with id: $channelId');
    channel.deletedAt = DateTime.now();
    await Channel.db.updateRow(session, channel);
    final channelWithId = await Channel.db.updateRow(session, channel);
    return channelWithId;
  }
}
