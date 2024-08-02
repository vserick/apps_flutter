import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Container(
                    height: 150,
                    // color: Colors.amber,
                  ),
                  Container(
                    height: 150,
                    // color: Colors.amber,
                  ),
                  Container(
                    height: 150,
                    // color: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
