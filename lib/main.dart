import 'package:flutter/material.dart';
import 'splashscreen.dart';  // Importa la pantalla de carga
import 'login.dart';   // Importa la pantalla de login
import 'signin.dart'; // Importa la pantalla de registro

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlantCare',
      initialRoute: '/', // Define la ruta inicial
      routes: {
        '/': (context) => SplashScreen(),  // Pantalla de carga
        '/login': (context) => LoginScreen(),  // Pantalla de login
        '/register': (context) => RegisterScreen(),  // Pantalla de registro
      },
    );
  }
}
