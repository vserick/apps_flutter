import 'package:app_futebol/app_state.dart';
import 'package:app_futebol/injector.dart';
import 'package:app_futebol/login/login_screen.dart';
import 'package:flutter/material.dart';

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = getIt.get<AppState>();
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) => _builder(context, appState),
    );
  }

  Widget _builder(BuildContext context, AppState appState) {
    switch (appState.initState) {
      case InitState.naoConfigurado:
        return const LoginScreen();
      case InitState.inicializando:
        return Container();
      default:
        return Container();
    }
  }
}
