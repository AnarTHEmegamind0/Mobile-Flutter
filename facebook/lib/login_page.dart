
import 'package:facebook/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  void onRegister(BuildContext context) {
    Navigator.popAndPushNamed(context,
    RouteNames.registerPage.route); // pop the current route and push the new route
  }

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => onRegister(context),
              child: const Text("register page oroh")),
        ],
      ),
    );
  }
}
