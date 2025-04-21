import 'package:flutter/material.dart';
import 'package:lab2/widgets/BodyContainer.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(), 
      themeMode: ThemeMode.system, 
      home: SafeArea(child:  BodyContainer()), 
    );
  }
}
