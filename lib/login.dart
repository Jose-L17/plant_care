
import 'package:flutter/material.dart';
import 'package:plant_care/signin.dart';

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
              'assets/plant_background.png', // Imagen de fondo
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
                Image.asset('assets/plantcare_logo.png', width: 200),
                SizedBox(height: 20),

                // Correo electrónico
                _buildTextField("Correo electrónico"),
                SizedBox(height: 10),

                // Contraseña
                _buildTextField("Contraseña", obscureText: true),
                SizedBox(height: 20),

                // Botón de Ingresar
                ElevatedButton(
                  onPressed: () {
                    // Simular autenticación y mostrar mensaje antes de ir a la pantalla de éxito
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Iniciando sesión..."), duration: Duration(seconds: 2)),
                    );

                    // Después de 2 segundos, navegar a la pantalla de "Registro Exitoso"
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(context, '/register_success');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'INGRESAR',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: '¿No tienes cuenta? ',
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

  // Método para construir los TextFields con diseño uniforme
  Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.green[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
