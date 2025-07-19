import 'package:chat_flutter/src/connection/domain/connection_repository.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../auth/view/page/sign_in_page.dart';
import '../connection/view/bloc/connection_bloc.dart';
import '../connection/view/widget/retry_connection_dialog.dart';
import '../inject/inject.dart';
import '../l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ConnectionBloc>()
        ..add(
          ConnectionEvent.subscribe(),
        ),
      child: _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, ConnectionState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Serverpod Example',
          localizationsDelegates: const [
            AppLocalizations.delegate, // Your app's localization delegate
            GlobalMaterialLocalizations.delegate, // Material widgets localizations
            GlobalWidgetsLocalizations.delegate, // Basic widgets localizations
            GlobalCupertinoLocalizations.delegate, // Cupertino widgets localizations
          ],
          // Cupertino widgets localizations
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            // overlay
            if (state.serverStatus == ServerStatus.waitingToRetry) {
              return Stack(
                children: [
                  child!,
                  RetryConnectionDialog(),
                ],
              );
            }
            return child!;
          },
          home: const SignInPage(),
        );
      },
    );
  }
}
