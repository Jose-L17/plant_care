
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
                const _Header(),
                _PlantGrid(plants: plants),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Align(
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
          Positioned(
            top: 135,
            right: 20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {

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
                    Navigator.pushNamed(context, '/add-plant');
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
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        itemCount: plants.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.green100,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  plant['image']!,
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                plant['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
