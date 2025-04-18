import 'package:flutter/material.dart';
import '../theme.dart';

class CustomIconButton extends StatelessWidget {
  final String label;
  final VoidCallback?
      onPressed; // `VoidCallback?` pour accepter `null` si le bouton est désactivé
  final Color color;
  final bool isDisabled;
  final bool outline;
  final IconData? icon;
  final bool beforeIcon;

  // Constructeur
  const CustomIconButton({
    required this.label,
    required this.onPressed,
    required this.color,
    this.isDisabled = false,
    this.outline = false,
    this.icon,
    this.beforeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    if (outline) {
      // Utilisation d'OutlinedButton pour un fond transparent et un contour
      return OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            fixedSize: Size(double.infinity, 40),
            side: BorderSide(
              color: isDisabled
                  ? colorScheme.onPrimaryContainer
                      .withOpacity(0.5)
                  : colorScheme.outline, // Couleur du contour
              width: 1.0, // Épaisseur du contour
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), // Arrondi du bouton
            ),
            padding:
                EdgeInsets.symmetric(horizontal: 20), // Espacement du contenu
          ),
          child: Row(children: [
            if(beforeIcon) Icon(
              // Icons.arrow_right_alt_rounded,
              icon,
              color: color,
              size: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                style: TextStyle(
                  color: isDisabled
                      ? colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.5)
                      : color, // Couleur du texte
                  fontSize: 14,
                )
                ),
            ),
            if(!beforeIcon) Icon(
              // Icons.arrow_right_alt_rounded,
              icon,
              color: color,
              size: 20.0,
            ),
          ]));
    } else {
      // Utilisation d'ElevatedButton pour un fond rempli
      return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled
                ? colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.12)
                : color.withOpacity(0.75), // Couleur du fond
            fixedSize: beforeIcon? Size(double.infinity, 40):Size(double.infinity, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24),
            elevation: 0,
          ),
          child: 
          // Center(  child:
            Row(children: [
            if(beforeIcon) Icon(
              // Icons.arrow_right_alt_rounded,
              icon,
              color: colorScheme.onPrimaryContainer,
              size: 20.0,
            ),
            Text(
              label,
              style: TextStyle(
                color: isDisabled
                    ? colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.5)
                    : colorScheme
                        .onPrimaryContainer, // Couleur du texte
                fontSize: 14,
              ),
            ),
            if(!beforeIcon) Icon(
              // Icons.arrow_right_alt_rounded,
              icon,
              color: colorScheme.onPrimaryContainer,
              size: 20.0,
            ),
          ])
          // )
          );
    }
  }
}
