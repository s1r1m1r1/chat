import 'package:chat_flutter/src/ws_connection/view/bloc/ws_connection_bloc.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../domain/ws_connection_repository.dart';

class ConnectStatusBar extends StatelessWidget {
  const ConnectStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WsConnectionBloc, WsConnectionState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.serverStatus == ServerStatus.waitingToRetry
              ? () {
                  context.read<WsConnectionBloc>().add(WsConnectionEvent.retryConnection());
                }
              : null,
          child: _buildColoredStatusText(context, state),
        );
      },
    );
  }

  // Private helper method to build the colored status text
  Widget _buildColoredStatusText(
    BuildContext context, // Accept context
    WsConnectionState state,
  ) {
    Color textColor;
    String statusText;
    final AppLocalizations localizations = AppLocalizations.of(context)!; // Access localizations here
    if (state.serverStatus == ServerStatus.connected) {
      textColor = Colors.green; // Good health (connected)
      statusText = localizations.connectionStatusConnected;
    } else if (state.internetStatus == InternetStatus.noInternet) {
      textColor = Colors.red; // Bad health (no internet)
      statusText = localizations.connectionStatusNoInternet;
    } else if (state.isReconnecting || state.serverStatus == ServerStatus.connecting) {
      textColor = Colors.grey; // Bad health (failed connection)
      statusText = localizations.connectionStatusConnecting + " ${state.reconnectAttempt}";
    } else if (state.serverStatus == ServerStatus.waitingToRetry) {
      textColor = Colors.grey; // Bad health (failed connection)
      statusText = localizations.connectionStatusWaitingToRetry;
    } else if (state.serverStatus == ServerStatus.disconnected) {
      textColor = Colors.red; // Bad health (failed connection)
      statusText = localizations.connectionStatusServerNotAvailable;
    } else {
      textColor = Colors.red; // Bad health (failed connection)
      statusText = localizations.connectionStatusFailed;
    }

    return Text(
      statusText,
      style: TextStyle(
        fontSize: 8,
        color: textColor, // Apply the determined color
      ),
    );
  }
}
