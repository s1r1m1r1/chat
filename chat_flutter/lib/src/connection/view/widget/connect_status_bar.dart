import 'package:chat_flutter/src/connection/view/bloc/connection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../../domain/connection_repository.dart';
// Assuming these imports are correctly set up for your project
// import 'package:your_app/cubits/connection_cubit.dart';
// import 'package:your_app/services/get_it_setup.dart'; // For getIt

class ConnectStatusBar extends StatelessWidget {
  const ConnectStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<ConnectionBloc>().state;

        return TextButton(
          onPressed: state.serverStatus != ServerStatus.connected
              ? () {
                  context
                      .read<ConnectionBloc>()
                      .add(ConnectionEvent.reconnect());
                }
              : null,
          child: _buildColoredStatusText(
              context, state.internetStatus, state.serverStatus),
        );
      },
    );
  }

  // Private helper method to build the colored status text
  Widget _buildColoredStatusText(
      BuildContext context, // Accept context
      InternetStatus internetStatus,
      ServerStatus serverStatus) {
    Color textColor;
    String statusText;
    final AppLocalizations localizations =
        AppLocalizations.of(context)!; // Access localizations here

    switch ((internetStatus, serverStatus)) {
      case (InternetStatus.available, ServerStatus.connected):
        textColor = Colors.green; // Good health (connected)
        statusText = localizations.connectionStatusConnected;
        break;
      case (InternetStatus.available, ServerStatus.connecting):
        textColor = Colors.grey; // Connection in progress
        statusText = localizations.connectionStatusConnecting;
        break;
      case (InternetStatus.available, ServerStatus.waitingToRetry):
        textColor = Colors.grey; // Connection in progress
        statusText = localizations.connectionStatusWaitingToRetry;
        break;
      case (InternetStatus.available, ServerStatus.disconnected):
        textColor = Colors.red; // Bad health (server not available)
        statusText = localizations.connectionStatusServerNotAvailable;
        break;
      case (InternetStatus.available, ServerStatus.failed):
        textColor = Colors.red; // Bad health (failed connection)
        statusText = localizations.connectionStatusFailed;
        break;
      case (InternetStatus.noInternet, _):
        textColor = Colors.red; // Bad health (no internet)
        statusText = localizations.connectionStatusNoInternet;
        break;
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
