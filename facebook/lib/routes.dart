import 'package:facebook/home_page.dart';
import 'package:facebook/login_page.dart';
import 'package:facebook/register_page.dart';
import 'package:flutter/material.dart';

enum RouteNames {
  homePage,
  loginPage,
  registerPage;

  String get route {
    switch (this) {
      case RouteNames.homePage: return "home";
      case RouteNames.loginPage: return "login";
      case RouteNames.registerPage: return "register";
    }
  }
}

var routes = <String, WidgetBuilder>{
  RouteNames.homePage.route:  (_) => const HomePage(),
  RouteNames.loginPage.route:  (_) => const LoginPage(),
  RouteNames.registerPage.route:  (_) => const RegisterPage("ene"),
};