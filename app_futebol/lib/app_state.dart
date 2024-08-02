import 'package:flutter/foundation.dart';

enum InitState { naoConfigurado, inicializando, configurado }

class AppState extends ChangeNotifier {
  AppState() {
    initialize();
  }

  InitState initState = InitState.naoConfigurado;

  void initialize() {}
}
