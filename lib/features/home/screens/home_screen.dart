
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> plants = const [
    {'name': 'Planta 1', 'image': 'assets/images/plant.png'},
    {'name': 'Planta 2', 'image': 'assets/images/plant.png'},
    {'name': 'Planta 3', 'image': 'assets/images/plant.png'},
    {'name': 'Planta 4', 'image': 'assets/images/plant.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const _Header(),
                _PlantGrid(plants: plants),
                const SizedBox(height: 100),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: _BottomDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // altura total del header
      child: Stack(
        children: [
          // Logo centrado y separado del Positioned
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 120, // altura visible del logo
              child: Image.asset(
                'lib/assets/images/namerapp.png',
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Íconos posicionados de forma absoluta
          Positioned(
            top: 135, // esta vez sí bajamos los íconos de verdad
            right: 20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Acción de cámara
                  },
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 26,
                    color: AppColors.green900,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Acción de agregar
                  },
                  child: const Icon(
                    Icons.add,
                    size: 26,
                    color: AppColors.green900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlantGrid extends StatelessWidget {
  final List<Map<String, String>> plants;

  const _PlantGrid({required this.plants});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: plants.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Container(
            decoration: BoxDecoration(
              color: AppColors.green100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  plant['image']!,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  plant['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BottomDecoration extends StatelessWidget {
  const _BottomDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/background.png',
      fit: BoxFit.cover,
      height: 100,
      width: double.infinity,
      semanticLabel: 'Decoración inferior',
    );
  }
}
