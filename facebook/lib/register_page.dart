import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final String ene;
  const RegisterPage(this.ene, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register Page'),
            Text("ene"),
          ],
        ),
      ),
    );
  }
}

class Appbar {
}
