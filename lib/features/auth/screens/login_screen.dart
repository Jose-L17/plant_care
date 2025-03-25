
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:plant_care/core/theme/app_colors.dart';
import 'package:plant_care/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(
                      'lib/assets/images/logo2.png',
                      height: 230,
                      semanticLabel: 'Logo de la aplicación',
                    ),
                    const SizedBox(height: 30),
                    const LabeledTextField(label: 'Usuario'),
                    const SizedBox(height: 15),
                    const LabeledTextField(label: 'Contraseña', isPassword: true),
                    const SizedBox(height: 25),
                    _buildLoginButton(context), // Aquí pasamos context
                    const SizedBox(height: 30),
                    _buildRegisterText(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: const Size(double.infinity, 55),
        elevation: 8,
        shadowColor: Colors.black26,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      },
      child: const Text(
        'INICIAR SESIÓN',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
      ),
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '¿No tienes una cuenta? ',
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: 'Regístrate',
            style: const TextStyle(
              color: AppColors.green900,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
          ),
        ],
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const LabeledTextField({
    super.key,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: isPassword,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            filled: true,
            fillColor: AppColors.green100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ],
    );
  }
}
