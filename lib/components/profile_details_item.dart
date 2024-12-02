import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileDetailsItem extends StatelessWidget {
  final IconData icon; // L'icône affichée à gauche.
  final String title1; // Le titre (texte principal).
  final String title2; // Le titre (texte principal).
  final String detail1;
  final String detail2;
  final bool isUppercase; // Le détail (texte secondaire).

  const ProfileDetailsItem({
    Key? key,
    required this.icon,
    required this.title1,
    required this.detail1,
    required this.title2,
    required this.detail2,
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MaterialTheme.lightScheme().tertiary,
                            letterSpacing: 0.1,
                          ),
                          overflow: TextOverflow.ellipsis, // Coupe le texte avec "..." si nécessaire.
                          maxLines: 1, // Limite le texte à une seule ligne.
                        ),
                        const SizedBox(height: 2.4),
                        Text(
                          detail1,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: MaterialTheme.lightScheme().onTertiaryContainer,
                          ),
                          overflow: TextOverflow.ellipsis, // Coupe le texte avec "..." si nécessaire.
                          maxLines: 1, // Limite le texte à une seule ligne.
                        ),
                    ]),
                    SizedBox(width: MediaQuery.of(context).size.width/10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title2.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MaterialTheme.lightScheme().tertiary,
                            letterSpacing: 0.1,
                          ),
                          overflow: TextOverflow.ellipsis, // Coupe le texte avec "..." si nécessaire.
                          maxLines: 1, // Limite le texte à une seule ligne.11
                        ),
                        const SizedBox(height: 2.4),
                        Text(
                          detail2,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: MaterialTheme.lightScheme().onTertiaryContainer,
                          ),
                          overflow: TextOverflow.ellipsis, // Coupe le texte avec "..." si nécessaire.
                          maxLines: 1, // Limite le texte à une seule ligne.
                        ),
                    ]),
                ])

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
