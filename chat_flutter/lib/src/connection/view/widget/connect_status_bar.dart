import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:chat_flutter/src/connection/view/cubit/connection_cubit.dart';
import 'package:flutter/widgets.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectStatusBar extends StatelessWidget {
  const ConnectStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionCubit, ConnectionState>(
      builder: (context, state) {
        return Text(
          switch ((state.internetStatus, state.serverStatus)) {
            (InternetStatus.available, ServerStatus.connecting) =>
              'connecting...',
            (InternetStatus.available, ServerStatus.disconnected) =>
              'disconnected',
            (InternetStatus.available, ServerStatus.waitingToRetry) =>
              'waiting to retry',
            (InternetStatus.available, ServerStatus.connected) => 'connected',
            InternetStatus.noInternet => 'no internet',
            (_, _) => throw UnimplementedError(),
          },
          style: const TextStyle(),
        );
      },
    );
  }
}
