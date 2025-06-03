
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';
import 'package:plant_care/routes/app_routes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
                // Encabezado limpio sin iconos
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

                const SizedBox(height: 15),

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

                _AccountOption(
                  icon: Icons.alternate_email_outlined,
                  text: 'Editar mis datos',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editAccount);
                  },
                ),
                const SizedBox(height: 15),

                _AccountOption(
                  icon: Icons.delete_outline,
                  text: 'Eliminar mi cuenta',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.deleteConfirm);
                  },
                ),
                const SizedBox(height: 15),

                _AccountOption(
                  icon: Icons.logout,
                  text: 'Cerrar sesión',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: AppColors.green100,
                        title: const Text(
                          "¿Cerrar sesión?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          "¿Estás seguro de que deseas cerrar sesión?",
                          style: TextStyle(fontSize: 16),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("No", style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green800,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.login,
                                (route) => false,
                              );
                            },
                            child: const Text("Sí"),
                          ),
                        ],
                      ),
                    );
                  },
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

class _AccountOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _AccountOption({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
