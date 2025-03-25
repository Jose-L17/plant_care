
import 'package:flutter/material.dart';
import 'package:plant_care/features/auth/screens/login_screen.dart';
import 'package:plant_care/features/auth/screens/register_screen.dart';
import 'package:plant_care/features/auth/screens/registration_success_screen.dart';
import 'package:plant_care/features/splash/screens/splash_screen.dart';
import 'package:plant_care/features/auth/home/screens/main_navigation_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerSuccess = '/register-success';
  static const String main = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case registerSuccess:
        return MaterialPageRoute(builder: (_) => const RegistrationSuccessScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
