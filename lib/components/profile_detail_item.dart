import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileDetailItem extends StatelessWidget {
  final IconData icon; // L'icône affichée à gauche.
  final String title; // Le titre (texte principal).
  final String detail;
  final bool isUppercase; // Le détail (texte secondaire).

  const ProfileDetailItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    this.isUppercase = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: MaterialTheme.lightScheme().onTertiaryContainer,
          ),
          const SizedBox(width: 12), // Espacement entre l'icône et la colonne.
          Expanded( // Utilisation de Expanded pour occuper l'espace restant.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().tertiary,
                    letterSpacing: 0.1,
                    
                  ),
                ),
                const SizedBox(height: 2.4),
                Text(
                  detail,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().onTertiaryContainer,
                  ),
                  overflow: TextOverflow.ellipsis, // Coupe le texte avec "..." si nécessaire.
                  maxLines: 1, // Limite le texte à une seule ligne.
                ),

              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios, // Flèche à droite.
            size: 16,
            color: MaterialTheme.lightScheme().onTertiaryContainer,
          ),
        ],
      ),
    );
  }
}
