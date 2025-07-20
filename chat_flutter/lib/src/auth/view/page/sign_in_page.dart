import 'package:chat_flutter/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_apple_flutter/serverpod_auth_apple_flutter.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';
import '../../../../env_keys.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Center(
          child: Dialog(
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                SignInWithEmailButton(
                  caller: client.modules.auth,
                ),
                SignInWithGoogleButton(
                  caller: client.modules.auth,
                  // clientId: kIsWeb ? null , // Client ID of the client (null on web)
                  serverClientId: kIsWeb ? googleClientId : null, // Client ID from the server (required on web)
                  redirectUri: Uri.parse('http://localhost:8082/googlesignin'),
                  onFailure: () {
                    debugPrint("\n\nFailure GOOGLE\n\n");
                  },
                ),
                SignInWithAppleButton(
                  onFailure: () {
                    debugPrint("\n\nFailure APPLE\n\n");
                  },
                  caller: client.modules.auth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
