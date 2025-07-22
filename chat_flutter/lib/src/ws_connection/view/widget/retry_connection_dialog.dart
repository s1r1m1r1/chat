import 'package:chat_flutter/src/ws_connection/view/bloc/ws_connection_bloc.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';

class RetryConnectionDialog extends StatelessWidget {
  const RetryConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WsConnectionBloc, WsConnectionState>(
      builder: (context, state) {
        return Material(
          type: MaterialType.transparency,
          child: Container(
            color: Colors.black.withValues(alpha: 0.75),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(32.0),
                margin: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(maxWidth: 380),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 64,
                      color: Colors.red[500],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Network Disconnected",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A202C), // Equivalent to gray-900
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "It looks like you've lost your internet connection. Please check your network settings and try again.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4A5568), // Equivalent to gray-700
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isReconnecting
                            ? null
                            : () => context.read<WsConnectionBloc>().add(WsConnectionEvent.retryConnection()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              state.isReconnecting ? Colors.grey[400] : const Color(0xFF2563EB), // blue-600
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 4,
                          shadowColor: Colors.blue.withOpacity(0.3),
                        ),
                        child: state.isReconnecting
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text("Retrying...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                ],
                              )
                            : const Text(
                                "Retry Connection",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
