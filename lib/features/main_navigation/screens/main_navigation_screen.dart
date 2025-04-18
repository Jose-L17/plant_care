
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../../home/screens/notifications_screen.dart';
import '../../home/screens/account_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _screens[_currentIndex],

          // Barra de navegación flotante con sombra visible
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.001), // activa el renderizado de sombra
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // sombra notoria
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, -4), // sombra hacia arriba
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIcon(Icons.home_outlined, 0),
                    _buildIcon(Icons.notifications_outlined, 1),
                    _buildIcon(Icons.person_outline, 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Icon(
        iconData,
        size: 26,
        color: AppColors.green900,
      ),
    );
  }
}
