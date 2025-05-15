import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart'; 
import 'package:shop_app/home.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repositories/repo.dart';
import 'package:shop_app/services/JwtService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _rememberMe = false;


  Future<void> gotoHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final email = _emailCtrl.text.trim();
        final password = _passCtrl.text.trim();

        final loginResult = await Provider.of<MyRepo>(context, listen: false).login(email, password);


        if (loginResult != null ) {


          final userPayload = await Jwtservice(loginResult).getToken(loginResult);

          
          final authUser = await Provider.of<MyRepo>(context, listen: false)
              .fetchSingleUserData(userPayload!);

          if (authUser != null) {
            Provider.of<globalProvider>(context, listen: false)
                .loginUser(authUser);
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('errors.invalidCredentials'.tr())),
            );
          }

          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('errors.invalidCredentials'.tr())),
          );
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error logging in: $e");
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('errors.loginFailed'.tr())),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'auth.login'.tr(),
          style: GoogleFonts.limelight(
            textStyle: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/Mobile-login.jpg", height: 200),
              const SizedBox(height: 50),
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'errors.required'.tr();
                  }
                  // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  //   return 'errors.invalidEmail'.tr();
                  // }
                  return null;
                },
                decoration: _inputDecoration('auth.email'.tr()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'errors.required'.tr();
                  }
                  return null;
                },
                decoration: _inputDecoration('auth.password'.tr()),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(
                    "auth.rememberMe".tr(args: []),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('auth.forgotPassword'.tr())),
                      );
                    },
                    child: Text(
                      "auth.forgotPassword".tr(),
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : gotoHome,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                            "auth.login".tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      hintText: label,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.6)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    );
  }
}
