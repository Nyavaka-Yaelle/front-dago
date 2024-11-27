import 'package:flutter/material.dart';
import '../theme.dart';
class RestoOnYourCard extends StatelessWidget {
  final String imageResto;
  final String nomResto;
  final String description;

  const RestoOnYourCard({
    this.imageResto = 'assets/images/pakopako_image.png',
    required this.nomResto,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image à gauche
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0), // Image arrondie
          child: Image.asset(
            imageResto,
            height: 40.0,
            width: 40.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8.0), // Espace entre l'image et le texte
        // Texte à droite
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nom du restaurant en haut
              Text(
                nomResto,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: MaterialTheme.lightScheme().onSurface,
                ),
                overflow: TextOverflow.ellipsis, // Si le texte est trop long
                maxLines: 1, // Limiter à une ligne
              ),
              const SizedBox(height: 3.0), // Espacement entre le nom et la description
              // Description en bas
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: MaterialTheme.lightScheme().secondary,
                ),
                maxLines: 2, // Limiter la description à deux lignes
                overflow: TextOverflow.ellipsis, // Gestion du texte trop long
              ),
            ],
          ),
        ),
      ],
    );
  }
}
