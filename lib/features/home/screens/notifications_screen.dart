
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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

            // Título con icono
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_outlined, size: 26, color: AppColors.green900),
                SizedBox(width: 8),
                Text(
                  'Notificaciones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.green900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Lista de notificaciones
            const _NotificationItem(
              icon: Icons.notifications_active_outlined,
              text: 'Alarma de planta 1',
            ),
            const SizedBox(height: 15),

            const _NotificationItem(
              icon: Icons.warning_amber_outlined,
              text: 'Actualización',
            ),
            const SizedBox(height: 15),

            const _NotificationItem(
              icon: Icons.emoji_emotions_outlined,
              text: 'Valore nuestra app',
            ),

            const Spacer(),

            // Imagen decorativa inferior
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

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _NotificationItem({
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
          Icon(icon, size: 28, color: AppColors.green800),
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
