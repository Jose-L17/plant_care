
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green700, // Usando la paleta oficial
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: Colors.black87,
          elevation: 8,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontFamily: 'ComicNeue', // Si está registrada
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2.5, 2.5),
                blurRadius: 2,
                color: Colors.black, // Sombra tipo "stroke"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
