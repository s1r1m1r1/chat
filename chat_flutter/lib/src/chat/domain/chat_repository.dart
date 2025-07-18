import 'dart:async';

import 'package:chat_client/chat_client.dart';
import 'package:chat_flutter/src/user/domain/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

import '../../../main.dart';

abstract class ChatRepository {
  Future<List<ChatController>> getControllers();
  void dispose();
}

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final UserRepository _userRepository;
  ChatRepositoryImpl(this._userRepository);
  List<Channel>? _channels;
  final List<ChatController> _chatControllers = [];

//-----------------------------------------------------------------------------
  @override
  @disposeMethod
  void dispose() {
    _disposeChatControllers();
    _channels = null;
  }

// Disposes all chat controllers and removes the references to them.
  void _disposeChatControllers() {
    for (var chatController in _chatControllers) {
      chatController.dispose();
    }
  }

  @override
  Future<List<ChatController>> getControllers() async {
    _channels = await _getChannels();
    for (var channel in _channels!) {
      var controller = ChatController(
        channel: channel.channel,
        module: client.modules.chat,
        sessionManager: sessionManager,
      );
      _chatControllers.add(controller);
    }
    return List.of(_chatControllers);
  }

  Future<List<Channel>> _getChannels() async {
    final envId = await _userRepository.getEnvId();
    return client.channels.getChannels(environmentId: envId);
  }
}
