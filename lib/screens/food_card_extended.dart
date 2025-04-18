import 'package:flutter/material.dart';
import '../components/custom_button.dart'; // Assurez-vous que vous avez importé votre CustomButton
import '../components/horizontal_line.dart'; // Assurez-vous que vous avez importé votre CustomButton
import '../theme.dart';
class FoodCardExtended extends StatelessWidget {
  final String nomPlat;
  final String imagePlat;
  final String nomResto;
  final String imageResto;
  final String descriptionResto;
  final String descriptionPlat;

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
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Stack(
      children: [
        // Contenu de la carte
            Container(
              color: customColor.getColor("surfaceContainerLowest"),
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image collée en haut avec bord arrondi et ombre
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
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
                            height: 280,
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
                              color: Colors.white.withOpacity(0.65),
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
                        Container(
                          height: 26,
                          child: FittedBox(
                            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                            child: Text(
                              nomPlat,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurface,
                                decoration: TextDecoration.none,
                              ),
                              overflow: TextOverflow.ellipsis, // S'assurer que le texte ne déborde pas
                              maxLines: 1,                            
                            ),
                          ),
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
                                Container(
                                  height: 18,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                                    child: 
                                      Row(
                                        children: [
                                          Container(
                                            // height: 18,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                                              child: Text(
                                                nomResto,
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme.onSurface,
                                                  decoration: TextDecoration.none,
                                                ),
                                                overflow: TextOverflow.ellipsis, // Si le texte est trop long
                                                maxLines: 1, // Limiter à une ligne
                                              )
                                            )
                                          ),
                                          SizedBox(width: 4),
                                          Container(
                                            // height: 18,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                                              child:Icon(
                                                size: 16,
                                                Icons.check_circle,
                                                color: colorScheme.primary,
                                              )
                                            )
                                          )
                                        ],
                                      ),
                                  )),
                                      const SizedBox(height: 4.0), // Espacement entre le nom et la description
                                  // Description en bas
                                  Container(
                                    height: 14,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                                      child: Text(
                                        descriptionResto,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: colorScheme.secondary,
                                          decoration: TextDecoration.none,
                                        ),
                                        maxLines: 2, // Limiter la description à deux lignes
                                        overflow: TextOverflow.ellipsis, // Gestion du texte trop long
                                      )
                                    )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        HorizontalLine(color: colorScheme.outlineVariant),
                        SizedBox(height: 12),
                        Text(
                          'Description :',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface,
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
                            color: colorScheme.onSurfaceVariant,
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
            ),
        // Box collé au bottom avec bordures arrondies et ombre
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 160,
            // decoration: BoxDecoration(
            //   color: colorScheme.surfaceContainerLow,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(12),
            //     topRight: Radius.circular(12),
            //   ),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Color.fromARGB(36, 0, 0, 0),
            //       blurRadius: 4,
            //       offset: Offset(0, -1),
            //     ),
            //   ],
            // ),
            child: Column(
              children: [
                // Drag Handle en haut
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Container(
                //     width: 32,
                //     height: 4,
                //     decoration: BoxDecoration(
                //       color: colorScheme.outlineVariant,
                //       borderRadius: BorderRadius.circular(3),
                //     ),
                //   ),
                // ),
                Spacer(),
                // Bouton personnalisé en bas
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:16, left: 16.0, right:16),
                      child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                      CustomButton(
                        label: "Visiter le resto", 
                        color: colorScheme.primary,
                        onPressed: () {
                          print("Naviguer vers l'inscription");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SignupScreen()),
                          // );
                        },
                      ),
                      ],)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
