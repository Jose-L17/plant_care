
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

class EditSuccessScreen extends StatelessWidget {
  const EditSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Image.asset('assets/images/success_plant.png', height: 140),
                const SizedBox(height: 20),
                Image.asset('assets/images/plantcare_logo.png', height: 60),
                const SizedBox(height: 20),
                const Text(
                  "Actualización de datos exitosa!!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.main,
                      (route) => false,
                      arguments: 2, // ✅ Mostrar la pestaña Cuenta al volver
                    );
                  },
                  child: const Text("Regresar", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage('assets/images/background.png'),
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
