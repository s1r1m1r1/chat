import 'package:chat_flutter/src/chat/view/cubit/list_chat_controller_cubit.dart';
import 'package:chat_flutter/src/chat/view/page/chat_page.dart';
import 'package:chat_flutter/src/connection/view/widget/connect_status_bar.dart';
import 'package:chat_flutter/src/inject/inject.dart';
import 'package:chat_flutter/src/user/view/bloc/server_env_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

import '../../chat/view/widget/channel_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => getIt<ServerEnvCubit>()..init(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => getIt<ListChatControllerCubit>()..load(),
        ),
      ],
      child: BlocBuilder<ListChatControllerCubit, ListChatControllerState>(
        builder: (context, state) {
          switch (state) {
            case $InitialListChatController():
              return _loading(context, "Init 2");
            case $LoadingListChatController():
              return _loading(context, "L 2");
            case $FailureListChatController():
              return _loading(context, "F 2");
            case $LoadedListChatController():
              return _MainView(
                chatControllers: state.result,
              );
          }
        },
      ),
    );
  }

  Widget _loading(
    BuildContext ctx, [
    String? message,
  ]) {
    return Material(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != null) Text(message),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}

class _MainView extends StatefulWidget {
  final List<ChatController> chatControllers;

  const _MainView({
    required this.chatControllers,
  });

  @override
  State<_MainView> createState() => MainPageState();
}

class MainPageState extends State<_MainView> {
  ChatController? _selected;

  @override
  void initState() {
    super.initState();

    _selected = widget.chatControllers.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        actions: [ConnectStatusBar()],
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
