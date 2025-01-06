import 'package:flutter/material.dart';
import '../theme.dart';

class DeliveryItem extends StatelessWidget {
  final String motif;
  final String title;
  final String items;
  final String profileImage;

  DeliveryItem({
    required this.motif,
    required this.title,
    required this.items,
    this.profileImage = 'assets/images/pakopako_image.png',
  });
  String getImageMotif() {
    String img = "assets/images/foodee.png";
    if (motif == "Monee") img = "assets/images/monee.png";
    else if (motif == "Ridee") img = "assets/images/ridee.png";
    return img;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Container(
        color: colorScheme.surface,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the top
          children: [
            // Image arrondie à gauche
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(profileImage), // Remplacer par votre image
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
                  title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
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
                    color: colorScheme.onSurface,
                    letterSpacing: 0.1,
                    height: 1.33,
                  ),
                ),
                Text(
                  motif,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 0.1,
                    height: 1.33,
                  ),
                ),
              ],
            ),

            // Image Foodee en haut à droite
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4), // Padding pour aligner avec le texte
              child: Image.asset(
                getImageMotif(), // Remplacer par votre image foodee.png
                width: 20, // Taille de l'image Foodee
                height: 20,
              ),
            ),
          ],
        ));
  }
}
