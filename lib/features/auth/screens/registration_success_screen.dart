
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/app_routes.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            Image.asset(
              'lib/assets/images/logo2.png',
              width: 250,
              fit: BoxFit.contain,
              semanticLabel: 'Logo de la app',
            ),

            const SizedBox(height: 20),

            const Text(
              'REGISTRO EXITOSO!!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                fontFamily: 'ComicNeue', // Si está registrada
                color: AppColors.green900,
              ),
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: 'INGRESAR',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),

            const Spacer(),

            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                'lib/assets/images/background.png',
                fit: BoxFit.cover,
                height: 140,
                width: double.infinity,
                semanticLabel: 'Imagen decorativa inferior',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
