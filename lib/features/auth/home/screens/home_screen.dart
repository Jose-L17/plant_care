
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> plants = const [
    {'name': 'Planta 1', 'image': 'lib/assets/images/plant.png'},
    {'name': 'Planta 2', 'image': 'lib/assets/images/plant.png'},
    {'name': 'Planta 3', 'image': 'lib/assets/images/plant.png'},
    {'name': 'Planta 4', 'image': 'lib/assets/images/plant.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            const SizedBox(height: 10),
            _PlantGrid(plants: plants),
            const Spacer(),
            _BottomDecoration(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'lib/assets/images/namerapp.png', // Logo tipo texto "PlantCare"
            width: 160,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
                color: AppColors.green900,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                color: AppColors.green900,
              ),
            ],
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
    return Expanded(
      flex: 4,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  height: 70,
                  fit: BoxFit.contain,
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
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/background.png',
      fit: BoxFit.cover,
      height: 80,
      width: double.infinity,
      semanticLabel: 'Decoración inferior',
    );
  }
}
