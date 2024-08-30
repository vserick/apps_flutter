import 'package:app_futebol/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginState extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginState() {
    _auth.authStateChanges().listen(_onAuthStateChanged);

    _app = GetIt.I.get<AppState>();
  }

  late AppState _app;

  String _error = '';
  String get error => _error;

  User? _user;
  User? get user => _user;

  /// Atualiza o usuario quando o status da autenticacao for alterado.
  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }

  /// Registra um usuario no firebase.
  Future<void> registrar(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      _error = traduzirFirebaseAuthException(e);
      notifyListeners();
    }
  }

  /// Loga com usuario e senha no firebase.
  Future<void> entrar(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      _error = traduzirFirebaseAuthException(e);
      notifyListeners();
    } finally {
      if (_error.isEmpty) {
        _app.goToHome();
      }
    }
  }

  /// Faz logout do usuario.
  Future<void> logout() async {
    await _auth.signOut();
    _app.goToLogin();
  }

  void clearMsgError() {
    _error = '';
  }

  String traduzirFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'O e-mail fornecido é inválido.';
      case 'user-disabled':
        return 'Este usuário foi desativado.';
      case 'user-not-found':
        return 'Usuário não encontrado.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'email-already-in-use':
        return 'O e-mail fornecido já está em uso.';
      case 'operation-not-allowed':
        return 'Esta operação não é permitida.';
      case 'weak-password':
        return 'A senha fornecida é muito fraca.';
      default:
        return 'Ocorreu um erro desconhecido. Código de erro: ${e.code}';
    }
  }
}
