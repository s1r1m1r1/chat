import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:chat_flutter/src/user/domain/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

import '../../../main.dart';

abstract class ChatRepository {
  Future<List<Channel>> getChannels();
  Future<Map<String, ChatController>> getControllers();
  void dispose();
}

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final UserRepository _userRepository;
  ChatRepositoryImpl(this._userRepository);
  List<Channel>? _channels;
  final Map<String, ChatController> _chatControllers = {};
  var numJoinedChannels = 0;

  @override
  Future<List<Channel>> getChannels() async {
    if (_channels != null && _channels!.isNotEmpty) {
      return _channels!;
    }

    final envId = await _userRepository.getEnvId();
    _channels = await client.channels.getChannels(environmentId: envId);
    // Setup ChatControllers for all the channels in the list.
    for (var channel in _channels!) {
      var controller = ChatController(
        channel: channel.channel,
        module: client.modules.chat,
        sessionManager: sessionManager,
      );

      _chatControllers[channel.channel] = controller;

      // Listen to changes in the connection status of the chat channel.
    }
    return _channels!;
  }

//-----------------------------------------------------------------------------
  @override
  @disposeMethod
  void dispose() {
    _disposeChatControllers();
    _channels = null;
  }

  // Disposes all chat controllers and removes the references to them.
  void _disposeChatControllers() {
    for (var chatController in _chatControllers.values) {
      chatController.dispose();
    }
  }

  @override
  Future<Map<String, ChatController>> getControllers() async {
    await getChannels();
    return _chatControllers;
  }
}
