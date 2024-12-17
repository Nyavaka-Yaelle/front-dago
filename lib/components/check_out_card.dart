import 'package:flutter/material.dart';
import '../theme.dart';

class CheckoutCard extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback onPressed;

  const CheckoutCard({
    Key? key,
    required this.title, // Exemple : "2 menus"
    required this.price, // Exemple : "30 000 Ar"
    required this.onPressed, // Action du bouton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 300) {
      return Container(
        height: 56, // Hauteur du rectangle
        decoration: BoxDecoration(
          color: MaterialTheme.lightScheme().inverseSurface, // Couleur de fond
          borderRadius: BorderRadius.circular(100), // Bord arrondi
        ),
        padding: EdgeInsets.symmetric(horizontal: 12), // Padding interne
        margin: EdgeInsets.symmetric(horizontal: 12), // Padding interne
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          verticalDirection: VerticalDirection.down,
          children: [
            // Contenu gauche : Icône + Texte
            Row(
              children: [
                Icon(
                  Icons.approval_outlined, // Icône de repas
                  color: MaterialTheme.lightScheme().inverseOnSurface,
                  size: 24,
                ),
                SizedBox(width: 8), // Espacement entre l'icône et le texte
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title, // Exemple : "2 menus"
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MaterialTheme.lightScheme().inverseOnSurface,
                          height: 1.1),
                    ),
                    Text(
                      price, // Exemple : "30 000 Ar"
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: MaterialTheme.lightScheme().inverseOnSurface,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: onPressed, // Action lors du clic
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MaterialTheme.lightScheme().primary, // Couleur du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // Bord arrondi
                ),
                padding: EdgeInsets.symmetric(horizontal: 16), // Taille du bouton
              ),
              child: Container(
                height: 40,
                child:Row(
                  children: [ 
                    Icon(
                      Icons.shopping_cart_checkout_outlined, // Icône de repas
                      color: MaterialTheme.lightScheme().onPrimary,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Voir le panier",
                      style: TextStyle(
                        fontSize: 14,
                        color: MaterialTheme.lightScheme().onPrimary,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ]
                )
              )
            )                
          ],
        ),
      );
    
    }
  }
