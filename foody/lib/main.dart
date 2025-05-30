import 'package:flutter/material.dart';
import 'package:foody/screens/login_screen.dart';
import 'package:foody/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: kPrimaryLightColor,
      //     iconColor: kPrimaryColor,
      //     prefixIconColor: kPrimaryColor,
      //     contentPadding: EdgeInsets.symmetric(
      //       horizontal: defaultPadding,
      //       vertical: defaultPadding,
      //     ),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(30)),
      //       borderSide: BorderSide.none,
      //     ),
      //   ),
      ),
      home: LoginScreen(),
    );
  }
}
