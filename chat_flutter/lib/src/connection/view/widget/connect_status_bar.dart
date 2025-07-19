import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:chat_flutter/src/connection/view/cubit/connection_cubit.dart';
import 'package:flutter/material.dart' show TextButton;
import 'package:flutter/widgets.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inject/inject.dart';

class ConnectStatusBar extends StatelessWidget {
  const ConnectStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ConnectionCubit>()..subscribe(),
      child: BlocBuilder<ConnectionCubit, ConnectionState>(
        builder: (context, state) {
          return TextButton(
            onPressed: state.serverStatus != ServerStatus.waitingToRetry
                ? () async {
                    await context.read<ConnectionCubit>().retryConnection();
                  }
                : null,
            child: Text(
              switch ((state.internetStatus, state.serverStatus)) {
                (InternetStatus.available, ServerStatus.connecting) =>
                  'connecting...',
                (InternetStatus.available, ServerStatus.disconnected) =>
                  'disconnected',
                (InternetStatus.available, ServerStatus.waitingToRetry) =>
                  'waiting to retry',
                (InternetStatus.available, ServerStatus.connected) =>
                  'connected',
                (InternetStatus.available, ServerStatus.failed) => 'failed',
                (InternetStatus.noInternet, _) => 'no internet',
              },
              style: const TextStyle(fontSize: 8),
            ),
          );
        },
      ),
    );
  }
}
