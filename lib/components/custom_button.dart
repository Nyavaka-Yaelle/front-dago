import 'package:flutter/material.dart';
import '../theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback?
      onPressed; // `VoidCallback?` pour accepter `null` si le bouton est désactivé
  final Color color;
  final bool isDisabled;
  final bool outline;

  // Constructeur
  const CustomButton({
    required this.label,
    required this.onPressed,
    required this.color,
    this.isDisabled = false,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);
    double height = 40;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 200) height = 20;
    if (outline) {
      // Utilisation d'OutlinedButton pour un fond transparent et un contour
      return OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          fixedSize: Size(double.infinity, height),
          side: BorderSide(
            color: isDisabled
                ? colorScheme.onSurface.withOpacity(0.5)
                : colorScheme.outline, // Couleur du contour
            width: 1.0, // Épaisseur du contour
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Arrondi du bouton
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 20), // Espacement du contenu
        ),
        child: Container(
          alignment: Alignment.center,
          height: 20,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
            child: Text(
              label,
              style: TextStyle(
                color: isDisabled
                    ? colorScheme.onSurface.withOpacity(0.5)
                    : colorScheme.primary, // Couleur du texte
                fontSize: 16,
              ),
            ),
          ),
        ),
        // child: Text(
        //   label,
        //   style: TextStyle(
        //     color: isDisabled
        //         ? colorScheme.onSurface.withOpacity(0.5)
        //         : colorScheme.primary, // Couleur du texte
        //     fontSize: 16,
        //   ),
        // ),
      );
    } else {
      // Utilisation d'ElevatedButton pour un fond rempli
      return ElevatedButton(
        
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isDisabled
              ? colorScheme.onSurface.withOpacity(0.12)
              : color, // Couleur du fond
          fixedSize: Size(double.infinity, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 20,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
            child: Text(
              label,
              style: TextStyle(
                color: isDisabled
                    ? colorScheme.onSurface.withOpacity(0.5)
                    : customColor.getColor("surfaceContainerLowest"), // Couleur du texte
                fontSize: 16,
              ),
            ),
          ),
        ),
        
      );
    }
  }
}
