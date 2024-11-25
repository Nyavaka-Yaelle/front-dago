import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  // Constructeur
  const CustomButton({
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // La couleur du bouton que tu passeras en paramètre
        fixedSize: Size(double.infinity, 40), // Hauteur de 40 et largeur infinie
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), // Border radius de 100
        ),
        padding: EdgeInsets.symmetric(horizontal: 20), // Pour ajuster l'espacement du texte
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white, // Couleur du texte
          fontSize: 16, // Taille de la police
        ),
      ),
    );
  }
}
