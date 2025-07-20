import 'package:chat_server/src/box/populate_database.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod_chat_server/serverpod_chat_server.dart' as chat;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    // authenticationHandler: (
    //   Session session,
    //   String key,
    // ) async {
    //   /// Bearer token validation handler
    //   var (uid, scopes) = await myBearerTokenValidator(session, token);
    //   if (uid == null || scopes == null) return null;

    //   return AuthenticationInfo(uid, scopes);
    // },
    authenticationHandler: auth.authenticationHandler,
  );

  // Configures sign in with email to print out the validation codes on the
  // console. In a real-world application, these methods would send emails to
  // the users to validate their email.
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      // Retrieve the credentials
      final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
      final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

      // Create a SMTP client for Gmail.
      final smtpServer = gmail(gmailEmail, gmailPassword);

      // Create an email message with the validation code.
      final message = Message()
        ..from = Address(gmailEmail)
        ..recipients.add(email)
        ..subject = 'Verification code for Serverpod'
        ..html = 'Your verification code is: $validationCode';

      // Send the email message.
      try {
        await send(message, smtpServer);
      } catch (_) {
        // Return false if the email could not be sent.
        return false;
      }

      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      // Retrieve the credentials
      final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
      final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

      // Create a SMTP client for Gmail.
      final smtpServer = gmail(gmailEmail, gmailPassword);

      // Create an email message with the password reset link.
      final message = Message()
        ..from = Address(gmailEmail)
        ..recipients.add(userInfo.email!)
        ..subject = 'Password reset link for Serverpod'
        ..html = 'Here is your password reset code: $validationCode';

      // Send the email message.
      try {
        await send(message, smtpServer);
      } catch (_) {
        // Return false if the email could not be sent.
        return false;
      }

      return true;
    },
  ));

  // Configure the chat module. By default, chat messages are posted internally
  // on a single server. If you are running the chat in a cluster of servers
  // the postMessagesGlobally needs to be enabled. You will also need to enable
  // Redis in the config files.
  chat.ChatConfig.set(chat.ChatConfig(
    postMessagesGlobally: false,
  ));

  // Setup a redirect route for Google sign in. Responsible for sending back
  // the serverAuthCode to the client and closing the signin window, after a
  // successful sign in.
  pod.webServer.addRoute(auth.RouteGoogleSignIn(), '/googlesignin');

  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );
  // Start the server.
  await pod.start();

  // Create an initial set of entries in the database, if they do not exist
  // already.
  await populateDatabase(pod);
}
