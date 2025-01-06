import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon; // L'icône affichée à gauche.
  final String title; // Le titre (texte principal).
  final String detail;
  final bool isUppercase; // Le détail (texte secondaire).

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    this.isUppercase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 24), // Espacement entre l'icône et la colonne.
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isUppercase? title.toUpperCase(): title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
              const SizedBox(height: 2.4),
              Text(
                detail,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.tertiary,
                    letterSpacing: 0.1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
