import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/global_keys.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repositories/repo.dart';
import 'package:shop_app/screens/splash.dart';
import 'package:shop_app/services/HttpServices.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('mn', 'MN')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<globalProvider>(
            create: (context) => globalProvider(),
          ),
          Provider<HttpServices>(
            create: (_) => HttpServices(baseUrl: "https://fakestoreapi.com"),
          ),
          ProxyProvider<HttpServices, MyRepo>(
            update: (__, httpService, _) => MyRepo(httpService: httpService),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
  Future.delayed(Duration(milliseconds: 500), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: GlobalKeys.navigatorKey,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              clampDouble(
                // ignore: deprecated_member_use
                MediaQuery.of(context).textScaleFactor,
                0.8,
                1.4,
              ),
            ),
          ),
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.grey[50],
        colorScheme: ColorScheme.light(
          primary: Colors.red,
          secondary: Colors.redAccent,
          surface: Colors.white,
        ),
        // Accessibility-friendly text themes
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          bodyLarge: TextStyle(fontSize: 14, height: 1.5, letterSpacing: 0.5),
          bodyMedium: TextStyle(fontSize: 12, height: 1.5, letterSpacing: 0.25),
        ).apply(fontSizeFactor: 1.0, fontSizeDelta: 2.0),
        // Make buttons larger for better touch targets
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: const Size(88, 48), // Larger touch target
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[50],
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
