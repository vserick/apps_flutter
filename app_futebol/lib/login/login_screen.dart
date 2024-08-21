import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
                      color: Theme.of(context).colorScheme.surface,
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
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Entrar')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formFields() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                )),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(
                  Icons.key,
                )),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
