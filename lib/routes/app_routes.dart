
import 'package:flutter/material.dart';
import 'package:plant_care/features/auth/screens/login_screen.dart';
import 'package:plant_care/features/auth/screens/register_screen.dart';
import 'package:plant_care/features/auth/screens/registration_success_screen.dart';
import 'package:plant_care/features/splash/screens/splash_screen.dart';
import 'package:plant_care/features/main_navigation/screens/main_navigation_screen.dart';
import 'package:plant_care/features/home/screens/add_plant_screen.dart';
import 'package:plant_care/features/home/screens/edit_account_screen.dart';
import 'package:plant_care/features/home/screens/edit_success_screen.dart';
import 'package:plant_care/features/home/screens/delete_confirm_screen.dart'; // ✅ NUEVO
import 'package:plant_care/features/home/screens/delete_success_screen.dart'; // ✅ NUEVO

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String registerSuccess = '/register-success';
  static const String main = '/main';
  static const String addPlant = '/add-plant';
  static const String editAccount = '/edit-account';
  static const String editSuccess = '/edit-success';
  static const String deleteConfirm = '/delete-confirm'; // ✅ NUEVO
  static const String deleteSuccess = '/delete-success'; // ✅ NUEVO

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
        final int index = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MainNavigationScreen(initialIndex: index),
        );
      case addPlant:
        return MaterialPageRoute(builder: (_) => const AddPlantScreen());
      case editAccount:
        return MaterialPageRoute(builder: (_) => const EditAccountScreen());
      case editSuccess:
        return MaterialPageRoute(builder: (_) => const EditSuccessScreen());
      case deleteConfirm:
        return MaterialPageRoute(builder: (_) => const DeleteConfirmScreen()); // ✅
      case deleteSuccess:
        return MaterialPageRoute(builder: (_) => const DeleteSuccessScreen()); // ✅
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
