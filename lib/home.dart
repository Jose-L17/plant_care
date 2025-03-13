
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Flexible(
            child: Image.asset(
              'assets/namerapp.jpeg',
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.photo_camera, color: Colors.black, size: 28),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.black, size: 28),
              onPressed: () {},
            ),
          ],
          automaticallyImplyLeading: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.9, // Ajuste para que se vea más parecido al diseño
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      _buildPlantCard(),
                      SizedBox(height: 8),
                      Text(
                        'Planta ${index + 1}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), // Menos opacidad para parecerse más al mockup
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 28),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications, size: 28),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 28),
                  label: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Image.asset(
          'assets/plant_icon.png',
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 50, color: Colors.red);
          },
        ),
      ),
    );
  }
}
