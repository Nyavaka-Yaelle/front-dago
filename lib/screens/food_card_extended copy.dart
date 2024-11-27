import 'package:flutter/material.dart';
import 'package:project1/components/horizontal_line.dart';
import '../theme.dart';

class FoodCardExtended extends StatelessWidget {
  final String nomPlat; // Titre du plat
  final String imagePlat; // URL ou chemin de l'image
  final String nomResto; // Nom du restaurant
  final String imageResto; // Image du restaurant
  final String descriptionResto; // Description du restaurant
  final String descriptionPlat; // Description du plat

  const FoodCardExtended({
    Key? key,
    required this.nomPlat,
    required this.nomResto,
    required this.descriptionPlat,
    required this.descriptionResto,
    this.imagePlat = 'assets/images/menu_card.png',
    this.imageResto = 'assets/images/pakopako_image.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MaterialTheme.lightScheme().surfaceContainerLowest,
      margin: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image collée en haut avec bord arrondi et ombre
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(4), // Coins inférieurs arrondis
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6, // Flou de l'ombre
                      offset: Offset(0, 2), // Décalage vertical
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(4), // Coins inférieurs arrondis
                  ),
                  child: Image.asset(
                    imagePlat,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Bouton retour
              Positioned(
                top: 32,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Simule un retour en arrière
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100), // Rond
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back, // Icône de retour
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Contenu de la carte
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomPlat,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().onSurface,
                    decoration: TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis, // S'assurer que le texte ne déborde pas
                  maxLines: 1, // Limiter à une ligne
                ),
                SizedBox(height: 8),
                Row(
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
                          Row(
                            children: [
                              Text(
                                nomResto,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: MaterialTheme.lightScheme().onSurface,
                                  decoration: TextDecoration.none,
                                ),
                                overflow: TextOverflow.ellipsis, // Si le texte est trop long
                                maxLines: 1, // Limiter à une ligne
                              ),
                              SizedBox(width: 4),
                              Icon(
                                size: 16,
                                Icons.check_circle,
                                color: MaterialTheme.lightScheme().primary,
                              )
                            ],
                          ),
                          const SizedBox(height: 4.0), // Espacement entre le nom et la description
                          // Description en bas
                          Text(
                            descriptionResto,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: MaterialTheme.lightScheme().secondary,
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 2, // Limiter la description à deux lignes
                            overflow: TextOverflow.ellipsis, // Gestion du texte trop long
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                HorizontalLine(color: MaterialTheme.lightScheme().outlineVariant),
                SizedBox(height: 12),
                Text(
                  'Description :',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().onSurface,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4),
                Text(
                  descriptionPlat,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().onSurfaceVariant,
                    letterSpacing: 0.5,
                    height: 1.33, 
                    decoration: TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis, // Eviter le débordement du texte
                  maxLines: 3, // Limiter à 3 lignes si nécessaire
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
