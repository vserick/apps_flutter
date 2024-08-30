import 'package:app_futebol/features/login/login_state.dart';
import 'package:app_futebol/theme/color_scheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum ScreenType { stLogin, stRegister }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerPass = TextEditingController();
  final _controllerPassConfirm = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ScreenType _tipoTela = ScreenType.stLogin;
  late LoginState _loginState;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loginState = GetIt.I.get<LoginState>();
  }

  void _validateForm() async {
    final isFormValidate = _formKey.currentState?.validate() ?? false;

    // Se algum dos TextFormFields não for validado, retorna, exibindo a mensagem de erro nele.
    if (!isFormValidate) {
      return;
    }

    setState(() {
      _loading = true;
    });

    // Se estiver registrando
    if (_tipoTela == ScreenType.stRegister) {
      await _loginState.registrar(
        _controllerEmail.text,
        _controllerPass.text,
      );
    }

    // Se não ocorreu nenhum erro registrando, ou só estiver logando, loga.
    if (_loginState.error.isEmpty) {
      await _loginState.entrar(
        _controllerEmail.text,
        _controllerPass.text,
      );
    }

    // Se ocorreu algum erro ao registrar ou logar, exibe uma snackbar com o erro
    if (_loginState.error.isNotEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          _loginState.error,
          style: const TextStyle(color: ColorApp.primary),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: ColorApp.tertiary,
      ));

      _loginState.clearMsgError();
    }

    setState(() {
      _loading = false;
    });
  }

  void _clearCache() {
    _controllerEmail.clear();
    _controllerPass.clear();
    _controllerPassConfirm.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: const Color.fromARGB(255, 8, 148, 104),
              height: double.infinity,
              width: double.infinity,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/background-login.jpeg',
                  fit: BoxFit.cover,
                ),
              )),
          SafeArea(
            child: ListenableBuilder(
                listenable: _loginState,
                builder: (context, snapshot) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        Text(
                          'Bem-Vindo ao Boleiros',
                          style: GoogleFonts.signikaNegative(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.surface,
                            shadows: [
                              const Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        _formFields(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (!_loading)
                              ElevatedButton(
                                onPressed: _validateForm,
                                child: _tipoTela == ScreenType.stLogin
                                    ? const Text('Entrar')
                                    : const Text('Registrar e Entrar'),
                              )
                            else
                              const Center(
                                  child: CircularProgressIndicator(
                                color: ColorApp.surface,
                              ))
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              _clearCache();
                              setState(() {
                                if (_tipoTela == ScreenType.stRegister) {
                                  _tipoTela = ScreenType.stLogin;
                                } else {
                                  _tipoTela = ScreenType.stRegister;
                                }
                              });
                            },
                            child: !_loading
                                ? _tipoTela == ScreenType.stLogin
                                    ? const Text(
                                        'Registrar-se',
                                        style:
                                            TextStyle(color: ColorApp.tertiary),
                                      )
                                    : const Text(
                                        'Cancelar',
                                        style:
                                            TextStyle(color: ColorApp.tertiary),
                                      )
                                : const Text(''))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _formFields() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: _controllerEmail,
            decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                )),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final email = value ?? '';
              if (email.trim().isEmpty || !email.contains('@')) {
                return 'Email inválido';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _controllerPass,
            decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(
                  Icons.key,
                )),
            obscureText: true,
            validator: (value) {
              final pass = value ?? '';
              if (pass.trim().isEmpty) {
                return 'Senha inválida';
              }
              return null;
            },
          ),
          if (_tipoTela == ScreenType.stRegister)
            const SizedBox(
              height: 20,
            ),
          if (_tipoTela == ScreenType.stRegister)
            TextFormField(
              controller: _controllerPassConfirm,
              decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  prefixIcon: Icon(
                    Icons.key,
                  )),
              obscureText: true,
              validator: (value) {
                final pass = value ?? '';
                if (pass.trim() != _controllerPass.text.trim()) {
                  return 'As senhas não conferem';
                }
                return null;
              },
            ),
        ],
      ),
    );
  }
}
