
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            Image.asset(
              'lib/assets/images/namerapp.png',
              width: 160,
              fit: BoxFit.contain,
              semanticLabel: 'Logo PlantCare',
            ),

            const SizedBox(height: 15),

            // Encabezado con icono
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_outline, size: 26, color: AppColors.green900),
                SizedBox(width: 8),
                Text(
                  'Mi Cuenta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.green900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Botones de cuenta
            const _AccountOption(
              icon: Icons.alternate_email_outlined,
              text: 'Editar mis datos',
            ),
            const SizedBox(height: 15),

            const _AccountOption(
              icon: Icons.delete_outline,
              text: 'Eliminar mi cuenta',
            ),
            const SizedBox(height: 15),

            const _AccountOption(
              icon: Icons.logout,
              text: 'Cerrar sesión',
            ),

            const Spacer(),

            // Imagen inferior decorativa
            Image.asset(
              'lib/assets/images/background.png',
              fit: BoxFit.cover,
              height: 80,
              width: double.infinity,
              semanticLabel: 'Decoración inferior',
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const _AccountOption({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.green100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, size: 26, color: AppColors.green800),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
