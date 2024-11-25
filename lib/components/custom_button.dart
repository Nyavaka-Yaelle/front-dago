import 'package:flutter/material.dart';
import '../theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed; // `VoidCallback?` pour accepter `null` si le bouton est désactivé
  final Color color;
  final bool isDisabled;

  // Constructeur
  const CustomButton({
    required this.label,
    required this.onPressed,
    required this.color,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed, // Désactive le bouton si isDisabled est true
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled
            ? MaterialTheme.lightScheme().onSurface.withOpacity(0.12)
            : color, // Change la couleur du bouton selon l'état
        fixedSize: Size(double.infinity, 40), // Hauteur de 40 et largeur infinie
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), // Border radius de 100
        ),
        padding: EdgeInsets.symmetric(horizontal: 20), // Ajuste l'espacement du texte
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDisabled
              ? MaterialTheme.lightScheme().onSurface.withOpacity(0.5)
              : Colors.white, // Change la couleur du texte selon l'état
          fontSize: 16, // Taille de la police
        ),
      ),
    );
  }
}
