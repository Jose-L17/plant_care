
import 'package:flutter/material.dart';
import 'package:plant_care/home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Imagen de fondo en la parte inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background.jpeg', // Imagen de fondo corregida
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo2.jpeg', // Imagen del logo corregida
                  width: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),

                // Texto "Usuario" (Centrado)
                _buildCenteredText("Usuario"),
                SizedBox(height: 5),
                _buildTextField(),

                SizedBox(height: 15),

                // Texto "Contraseña" (Centrado)
                _buildCenteredText("Contraseña"),
                SizedBox(height: 5),
                _buildTextField(obscureText: true),

                SizedBox(height: 20),

                // Botón de Login
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla principal después de iniciar sesión
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Texto de "¿No tienes cuenta? Regístrate"
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: '¿No tienes una cuenta? ',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Regístrate',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir los TextFields
  Widget _buildTextField({bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Método para construir los textos centrados
  Widget _buildCenteredText(String text) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
