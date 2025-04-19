import 'package:flutter/material.dart';
import 'package:facebook/routes.dart';
import 'package:facebook/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: routes,
    );
  }
}
