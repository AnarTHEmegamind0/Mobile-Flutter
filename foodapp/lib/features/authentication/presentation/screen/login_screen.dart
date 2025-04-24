import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../widgets/login_form.dart';
import '../../../../routes.dart';
import '../../../../core/utils/navigation_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(AuthRepositoryImpl());

    // Check if already logged in
    if (_authController.isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.navigateToAndReplace(context, AppRoutes.foodOrdering);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    final success = await _authController.login(
      _emailController.text,
      _passwordController.text,
    );

    if (success && mounted) {
      NavigationHelper.navigateToAndReplace(context, AppRoutes.foodOrdering);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_authController.errorMessage ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(
          emailController: _emailController,
          passwordController: _passwordController,
          onLogin: _handleLogin,
          isLoading: _authController.isLoading,
        ),
      ),
    );
  }
}
