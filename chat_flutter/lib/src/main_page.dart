import 'package:chat_flutter/src/chat/view/page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

import 'chat/view/widget/channel_drawer.dart';

class MainPage extends StatefulWidget {
  final List<ChatController> chatControllers;

  const MainPage({
    required this.chatControllers,
    super.key,
  });

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  ChatController? _selected;

  @override
  void initState() {
    super.initState();

    _selected = widget.chatControllers.first;
  }

  @override
  Widget build(BuildContext context) {
    // Find current chat controller and channel information

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(_selected?.channel ?? "not selected"),
      ),
      drawer: ChannelDrawer(
        controllers: widget.chatControllers,
        selected: _selected,
        onSelected: (value) {
          setState(() {
            _selected = value;
          });
        },
      ),
      body: _selected != null
          ? ChatPage(
              key: ValueKey(_selected?.channel),
              controller: _selected!,
            )
          : const Center(
              child: Text('Select a channel.'),
            ),
    );
  }
}
