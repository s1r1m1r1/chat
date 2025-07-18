import 'package:chat_flutter/main.dart';
import 'package:chat_flutter/src/chat_page.dart';
import 'package:chat_flutter/src/user/view/bloc/server_env_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

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
      drawer: _ChannelDrawer(
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

// The _ChannelDrawer displays a list of chat channels.
class _ChannelDrawer extends StatelessWidget {
  final List<ChatController> controllers;
  final ChatController? selected;
  final ValueSetter<ChatController?> onSelected;

  const _ChannelDrawer({
    required this.controllers,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    var mt = MediaQuery.of(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: mt.padding.top,
          ),
          ListTile(
            title: const Text('You are signed in'),
            trailing: OutlinedButton(
              onPressed: _signOut,
              child: const Text('Sign Out'),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child:
                Text('Channels', style: Theme.of(context).textTheme.bodySmall),
          ),
          BlocBuilder<ServerEnvCubit, ServerEnvState>(
            builder: (context, state) {
              switch (state) {
                case $ServerEnvStateInitial():
                case $ServerEnvStateLoading():
                  return const CircularProgressIndicator();
                case $ServerEnvStateSuccess():
                  return TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewChannelWidget(
                                  onAddChannel: (name) => client.channels
                                      .createChannel(
                                          name: name,
                                          channel: name,
                                          environmentId: state.id),
                                )));
                      },
                      child: const Text('New Channel'));
                case $ServerEnvStateFailure():
                  return const Text('Failed to load channels');
              }
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: controllers
                  .map<ListTile>(
                    (c) => ListTile(
                      title: Text(
                        c.channel,
                        style: c.channel == selected?.channel
                            ? const TextStyle(fontWeight: FontWeight.bold)
                            : null,
                      ),
                      onTap: () {
                        onSelected(c); // Select the channel

                        // Close the drawer
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  void _signOut() {
    sessionManager.signOutDevice();
  }
}

class NewChannelWidget extends StatefulWidget {
  final void Function(String) onAddChannel;

  const NewChannelWidget({
    super.key,
    required this.onAddChannel,
  });

  @override
  State<NewChannelWidget> createState() => _NewChannelWidgetState();
}

class _NewChannelWidgetState extends State<NewChannelWidget> {
  final _formKey = GlobalKey<FormState>();
  final _channelController = TextEditingController();

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _channelController,
                  decoration: const InputDecoration(
                    labelText: 'Channel',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a channel name';
                    }
                    return null;
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAddChannel(_channelController.text);
                    _channelController.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add Channel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
