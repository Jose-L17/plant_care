
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.transparent],
              ),
            ),
            child: Image.asset(
              'lib/assets/images/background.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                // Encabezado fijo
                SizedBox(
                  height: 200,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(
                        'lib/assets/images/namerapp.png',
                        width: 400,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Título visualmente más arriba
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const Row(
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
                ),

                const SizedBox(height: 10),

                Transform.translate(
                  offset: const Offset(0, -10),
                  child: const Column(
                    children: [
                      _NotificationItem(
                        icon: Icons.notifications_active_outlined,
                        text: 'Alarma de planta 1',
                      ),
                      SizedBox(height: 10),
                      _NotificationItem(
                        icon: Icons.warning_amber_outlined,
                        text: 'Actualización',
                      ),
                      SizedBox(height: 10),
                      _NotificationItem(
                        icon: Icons.emoji_emotions_outlined,
                        text: 'Valore nuestra app',
                      ),
                    ],
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ],
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
