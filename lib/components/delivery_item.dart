import 'package:flutter/material.dart';
import '../theme.dart';
class DeliveryItem extends StatelessWidget {
  final String restoName;
  final String items;
  final String foodeeImage;

  DeliveryItem({
    required this.restoName,
    required this.items,
    this.foodeeImage = 'assets/images/pakopako_image.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MaterialTheme.lightScheme().surface,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
      children: [
        // Image arrondie à gauche
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(foodeeImage), // Remplacer par votre image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10), // Espacement entre l'image et le texte

        // Column pour le texte à gauche
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 8),
            Text(
              restoName,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w600, 
                color: MaterialTheme.lightScheme().onSurfaceVariant,
                letterSpacing: 0.5,
                height: 1.33,
              ),
            ),
            Text(
              items,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500, 
                color: MaterialTheme.lightScheme().onSurface,
                letterSpacing: 0.1,
                height: 1.33,
              ),
            ),
            Text(
              'Foodee',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w500, 
                color: MaterialTheme.lightScheme().onSurfaceVariant,
                letterSpacing: 0.1,
                height: 1.33,
              ),
            ),
          ],
        ),

        // Image Foodee en haut à droite
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 4), // Padding pour aligner avec le texte
          child: Image.asset(
            'assets/images/foodee.png', // Remplacer par votre image foodee.png
            width: 20, // Taille de l'image Foodee
            height: 20,
          ),
        ),
      ],
    ));
  }
}
