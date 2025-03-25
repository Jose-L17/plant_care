
import 'package:flutter/material.dart';
import 'package:plant_care/core/theme/app_colors.dart';
import 'package:plant_care/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 30.0;

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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 20),
                  _Logo(),
                  SizedBox(height: 30),
                  _RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Image.asset(
        'lib/assets/images/logo2.png',
        height: 170,
        semanticLabel: 'Logo de la app',
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.green50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _LabelText('Nombre de Usuario'),
          const SizedBox(height: 5),
          const _CustomTextField(),
          const SizedBox(height: 15),

          const _LabelText('Correo Electrónico'),
          const SizedBox(height: 5),
          const _CustomTextField(),
          const SizedBox(height: 15),

          const _LabelText('Contraseña'),
          const SizedBox(height: 5),
          const _CustomTextField(isPassword: true),
          const SizedBox(height: 15),

          const _LabelText('Confirmar Contraseña'),
          const SizedBox(height: 5),
          const _CustomTextField(isPassword: true),
          const SizedBox(height: 20),

          const _RegisterButton(),
          const SizedBox(height: 10),
          _LoginRedirectText(),
        ],
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final bool isPassword;
  const _CustomTextField({this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.green300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5,
          shadowColor: Colors.black54,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.registerSuccess);
        },
        child: const Text(
          'REGISTRARSE',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                offset: Offset(1.2, 1.2),
                blurRadius: 2,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginRedirectText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text.rich(
            TextSpan(
              text: '¿Ya tienes una cuenta? ',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              children: [
                TextSpan(
                  text: 'Ingresa',
                  style: TextStyle(
                    color: AppColors.green900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
