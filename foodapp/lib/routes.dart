// lib/routes.dart
import 'package:flutter/material.dart';
import 'features/authentication/presentation/screens/login_screen.dart';
import 'features/food_ordering/presentation/screens/food_ordering_screen.dart';
import 'features/food_ordering/presentation/screens/order_confirmation_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String foodOrdering = '/food-ordering';
  static const String orderConfirmation = '/order-confirmation';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginScreen(),
    foodOrdering: (context) => const FoodOrderingScreen(),
    orderConfirmation: (context) => const OrderConfirmationScreen(),
  };
}
