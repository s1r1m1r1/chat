import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ChannelsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<Channel>> getAllChannels(
    Session session,
  ) async {
    final channels = await Channel.db.find(session);
    return channels;
  }

  Future<List<Channel>> getChannels(Session session,
      {required int environmentId}) async {
    final channels = await Channel.db.find(
      session,
      where: (t) =>
          t.environmentId.equals(environmentId) & t.deletedAt.equals(null),
      orderDescending: true,
    );
    return channels;
  }

  Future<Channel> createChannel(
    Session session, {
    required String name,
    required String channel,
    required int environmentId,
  }) async {
    // Get a list of all channels from the database
    final row =
        Channel(name: name, channel: channel, environmentId: environmentId);

    // final cacheKey = 'channel-${cannel.id}';
    // final cachedRecipe = await session.caches.local.get<Channel>(cacheKey);

    final channelWithId = await Channel.db.insertRow(session, row);
    return channelWithId;
  }
}
