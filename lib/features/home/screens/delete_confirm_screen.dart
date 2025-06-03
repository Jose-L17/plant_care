
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

class DeleteConfirmScreen extends StatelessWidget {
  const DeleteConfirmScreen({super.key});

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
                Image.asset('assets/images/plantcare_logo.png', height: 60),
                const SizedBox(height: 30),
                const Icon(Icons.warning_amber_rounded, size: 40, color: Colors.red),
                const SizedBox(height: 10),
                const Text(
                  "¿Eliminar tu cuenta?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
                  child: Text(
                    "Esta acción no se puede deshacer.\n¿Estás seguro que deseas eliminar tu cuenta?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  ),
                  onPressed: () {
                    // Simula eliminación de cuenta
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.deleteSuccess,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: AppColors.green800, fontWeight: FontWeight.bold),
                  ),
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
