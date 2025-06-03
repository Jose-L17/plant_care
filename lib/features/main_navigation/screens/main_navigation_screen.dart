
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';
import '../../home/screens/home_screen.dart';
import '../../home/screens/notifications_screen.dart';
import '../../home/screens/account_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;

  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationsScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Ya no hay imagen de fondo aquí

          // Pantalla activa
          _screens[_currentIndex],

          // Barra de navegación rectangular translúcida
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Container(
                height: 70,
                color: Colors.black.withOpacity(0.25),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIcon(Icons.home_outlined, 0),
                    _buildIcon(Icons.notifications_none_outlined, 1),
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
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Icon(
        iconData,
        size: 28,
        color: isSelected ? AppColors.green900 : Colors.black,
      ),
    );
  }
}
