import 'package:flutter/material.dart';
import '../components/restaurant_resume.dart'; // Assurez-vous que vous avez importé votre CustomButton
import '../components/resto_profile_card.dart'; // Assurez-vous que vous avez importé votre CustomButton
import '../components/categories.dart'; // Assurez-vous que vous avez importé votre CustomButton
import '../components/food_cards.dart';
import '../components/check_out_card.dart';
import '../theme.dart';
class FooderProfile extends StatelessWidget {
  final String nomPlat;
  final String imagePlat;
  final String nomResto;
  final String imageResto;
  final String descriptionResto;
  final String descriptionPlat;

  const FooderProfile({
    Key? key,
    this.nomPlat = "",
    this.nomResto = "Pakopako",
    this.descriptionPlat = "",
    this.descriptionResto = "",
    this.imagePlat = 'assets/images/menu_card.png',
    this.imageResto = 'assets/images/pakopako_image.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Contenu de la carte
            Container(
              color: MaterialTheme.lightScheme().surfaceContainerLowest,
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image collée en haut avec bord arrondi et ombre
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Column(
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
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ),
                            RestoProfileCard(nomResto: "Pakopako", ouvert: true, description: "Cuisine traditionelle de Majunga",star: 4.6),
                          ]
                        )
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
                  Container(
                    padding: const EdgeInsets.fromLTRB(12.0,0,12,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RestaurantResume(),
                        Container(
                          padding: EdgeInsets.fromLTRB(12, 4, 12, 0),
                          child: Divider(),
                        ),
                        Categories(titled: false),
                      ]),
                  ),
                ],
              ),
            ),        
             Container(
              margin: EdgeInsets.only(top: 350),
            child:
          SingleChildScrollView(
            // controller: _scrollController, 
              child:FoodCards(simple: true)
          )),
        // Box collé au bottom avec bordures arrondies et ombre
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Container(
            height: 56,
            child: CheckoutCard(
              title: "2 menus",
              price: "30 000 Ar",
              onPressed: () {
                print("Commande validée !");
              },
            )            
          ),
        ),
      ],
    );
  }
}
