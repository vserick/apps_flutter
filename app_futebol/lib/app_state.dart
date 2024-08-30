import 'package:flutter/foundation.dart';

enum InitState { naoConfigurado, logado, configurado }

class AppState extends ChangeNotifier {
  AppState() {
    initialize();
  }

  InitState initState = InitState.naoConfigurado;

  void initialize() {}

  void goToHome() {
    initState = InitState.logado;
    notifyListeners();
  }

  void goToLogin() {
    initState = InitState.naoConfigurado;
    notifyListeners();
  }
}
