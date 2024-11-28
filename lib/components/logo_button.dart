import 'package:flutter/material.dart';
import '../theme.dart';

class LogoButton extends StatelessWidget {
  final String text;
  final String logo;
  final double width;
  final VoidCallback onPressed;

  const LogoButton({
    Key? key,
    required this.text,
    required this.logo,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: MaterialTheme.lightScheme().surface,
        elevation: 0,
        side: BorderSide(
          color: MaterialTheme.lightScheme().onSurface.withOpacity(0.2), // Couleur de la bordure
          width: 1, // Épaisseur de la bordure
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(logo, width: width), // Logo à gauche
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MaterialTheme.lightScheme().onSurface,
              ),
            ), // Texte au centre
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: MaterialTheme.lightScheme().onSurface,
          ), // Flèche à droite
        ],
      ),
    );
  }
}
