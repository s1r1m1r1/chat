import 'package:chat_client/chat_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inject/inject.dart';
import '../../../user/view/bloc/server_env_cubit.dart';
import 'create_channel_input.dart';

class CreateChannelButton extends StatelessWidget {
  const CreateChannelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ServerEnvCubit>()..init(),
      child: BlocBuilder<ServerEnvCubit, ServerEnvState>(
        builder: (context, state) {
          switch (state) {
            case $ServerEnvStateInitial():
            case $ServerEnvStateLoading():
              return const CircularProgressIndicator();
            case $ServerEnvStateSuccess():
              return TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateChannelInput(
                              onAddChannel: (name) => getIt<Client>()
                                  .channels
                                  .createChannel(name: name, channel: name, environmentId: state.id),
                            )));
                  },
                  child: const Text('New Channel'));
            case $ServerEnvStateFailure():
              return const Text('Failed to load channels');
          }
        },
      ),
    );
  }
}
