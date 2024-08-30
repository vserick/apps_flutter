import 'package:app_futebol/app_state.dart';
import 'package:app_futebol/features/login/login_state.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AppState>(() => AppState());
  getIt.registerLazySingleton<LoginState>(() => LoginState());
}
