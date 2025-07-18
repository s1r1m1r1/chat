// The _ChannelDrawer displays a list of chat channels.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

import '../../../../main.dart';
import '../../../user/view/bloc/server_env_cubit.dart';
import 'new_channel_widget.dart';

class ChannelDrawer extends StatelessWidget {
  final List<ChatController> controllers;
  final ChatController? selected;
  final ValueSetter<ChatController?> onSelected;

  const ChannelDrawer({
    super.key,
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
