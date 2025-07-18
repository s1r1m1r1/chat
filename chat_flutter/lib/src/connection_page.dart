// import 'package:chat_client/chat_client.dart';
// import 'package:chat_flutter/src/disconnected_page.dart';
// import 'package:chat_flutter/src/inject/inject.dart';
// import 'package:chat_flutter/src/main_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';

// import '../main.dart';
// import 'loading_page.dart';
// import 'user/view/bloc/server_env_cubit.dart';

// class _ConnectionPage extends StatefulWidget {
//   const _ConnectionPage();

//   @override
//   _ConnectionPageState createState() => _ConnectionPageState();
// }

// class _ConnectionPageState extends State<_ConnectionPage> {
//   // List of channels as retrieved from the server. Null if the chats hasn't
//   // been successfully loaded.
//   List<Channel>? _channels;

//   // True if we are currently trying to connect to the server.
//   bool _connecting = false;

//   // Contains a list of ChatControllers.
//   final Map<String, ChatController> _chatControllers = {};

//   @override
//   void initState() {
//     super.initState();

//     // Starts listening to changes in the websocket connection.
//     client.addStreamingConnectionStatusListener(_changedConnectionStatus);
//     _connect();
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     // Stops listening to websocket connections.
//     client.removeStreamingConnectionStatusListener(_changedConnectionStatus);
//     _disposeChatControllers();
//   }

//   // Disposes all chat controllers and removes the references to them.
//   void _disposeChatControllers() {
//     for (var chatController in _chatControllers.values) {
//       chatController.dispose();
//     }
//     _chatControllers.clear();
//   }

//   // Starts connecting to the server. Connection is complete when we have
//   // established a connection to the websocket and to all chat channels.
//   Future<void> _connect() async {
//     // Reset to initial state.
//     setState(() {
//       _channels = null;
//       _connecting = true;
//       _disposeChatControllers();
//     });

//     try {
//       // Load list of channels.
//       _channels = await client.channels.getChannels();

//       // Make sure that the web socket is connected.
//       await client.openStreamingConnection();

//       // Setup ChatControllers for all the channels in the list.
//       for (var channel in _channels!) {
//         var controller = ChatController(
//           channel: channel.channel,
//           module: client.modules.chat,
//           sessionManager: sessionManager,
//         );

//         _chatControllers[channel.channel] = controller;

//         // Listen to changes in the connection status of the chat channel.
//         controller.addConnectionStatusListener(_chatConnectionStatusChanged);
//       }
//     } catch (e) {
//       // We failed to connect.
//       setState(() {
//         _channels = null;
//         _connecting = false;
//       });
//       return;
//     }
//   }

//   // This method is called whenever the state for the web socket has changed.
//   void _changedConnectionStatus() {
//     setState(() {});
//   }

//   // This method is called whenever we have established a connection to a chat
//   // channel.
//   void _chatConnectionStatusChanged() {
//     // Make sure that we have received the list of channels.
//     if (_channels == null || _channels!.isEmpty) {
//       setState(() {
//         _channels = null;
//         _connecting = false;
//       });
//       return;
//     }

//     var numJoinedChannels = 0;

//     // Count the number of channels that we have joined.
//     for (var chatController in _chatControllers.values) {
//       if (chatController.joinedChannel) {
//         numJoinedChannels += 1;
//       } else if (chatController.joinFailed) {
//         setState(() {
//           _channels = null;
//           _connecting = false;
//         });
//         return;
//       }
//     }

//     // If we have joined all the channels loading is complete.
//     if (numJoinedChannels == _chatControllers.length) {
//       setState(() {
//         _connecting = false;
//       });
//     }
//   }

//   // Attempt to reconnect to the server.
//   void _reconnect() {
//     if (client.streamingConnectionStatus ==
//         StreamingConnectionStatus.disconnected) {
//       _connect();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_connecting) {
//       return const LoadingPage();
//     } else if (_channels == null ||
//         client.streamingConnectionStatus ==
//             StreamingConnectionStatus.disconnected) {
//       return DisconnectedPage(
//         onReconnect: _reconnect,
//       );
//     } else {
//       return BlocProvider<ServerEnvCubit>(
//         lazy: false,
//         create: (_) => getIt()..init(),
//         child: BlocBuilder<ServerEnvCubit, ServerEnvState>(
//           builder: (context, state) {
//             switch (state) {
//               case $ServerEnvStateInitial():
//               case $ServerEnvStateLoading():
//                 return const LoadingPage();

//               case $ServerEnvStateSuccess():
//                 return MainPage(
//                   channels: _channels!,
//                   chatControllers: _chatControllers,
//                   serverEnvID: state.id,
//                 );
//               case $ServerEnvStateFailure():
//                 return RetryButton(
//                   onPressed: () {
//                     context.read<ServerEnvCubit>().init();
//                   },
//                 );
//             }
//           },
//         ),
//       );
//     }
//   }
// }
