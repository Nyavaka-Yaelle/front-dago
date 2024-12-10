import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class FoodCard extends StatelessWidget {
  final String nomPlat;
  final String nomResto;
  final String imagePlat;
  final String imageResto;
  final double? star;
  final double prix;
  final VoidCallback?
      onPressed; // `VoidCallback?` pour accepter `null` si le bouton est désactivé

  // Constructeur
  const FoodCard({
    required this.nomPlat,
    required this.nomResto,
    this.imagePlat = 'assets/images/menu_image.png',
    this.imageResto = 'assets/images/pakopako_image.png',
    this.star = 0,
    required this.prix,
    this.onPressed,
  });
  void showCardDetails() {
    print("show card details");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Si la largeur de l'écran est inférieure à 375, on applique une largeur de 160
    double width;
    // (screenWidth < 375) ? 160 : (screenWidth / 2 - 12 - 3);
    if (screenWidth < 330) {
      width = screenWidth - 48;
    } else if (screenWidth >= 330 && screenWidth < 375) {
      // Si la largeur de l'écran est inférieure à 375, la largeur est fixée à 160
      width = screenWidth / 2 - 15;
    } else if (screenWidth >= 375 && screenWidth < 550) {
      // Si la largeur de l'écran est entre 375 et 550, on utilise la moitié de la largeur de l'écran
      width = screenWidth / 2 - 24;
    } else if (screenWidth >= 550 && screenWidth < 830) {
      // Si la largeur de l'écran est entre 600 et 830, on utilise un quart de la largeur de l'écran
      width = screenWidth / 3 - 18;
    } else if (screenWidth >= 830 && screenWidth < 1024) {
      // Si la largeur de l'écran est supérieure à 850, on utilise la largeur complète moins un espace
      width = screenWidth / 4 - 20;
    } else if (screenWidth >= 1024) {
      // Si la largeur de l'écran est supérieure à 850, on utilise la largeur complète moins un espace
      width = screenWidth/5 -20;
    } else {
      // Par défaut, largeur fixe pour toute autre condition
      width = 160;
    } //MediaQuery.of(context).size.width/2 -12-3,

    return Container(
      // width: MediaQuery.of(context).size.width/2.5 ,
      width: width,
      // height: 200,
      // margin: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 6.0,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePlat,
              height: 116.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            alignment: Alignment.topLeft,
            height: 20,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
              child: Text(
                nomPlat,/// + screenWidth.toString(),
                style: TextStyle(
                  color: MaterialTheme.lightScheme().onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                )
              ),
            ),
          ),
          // Nom du plat
          // Text(
          //   nomPlat,/// + screenWidth.toString(),
          //   style: TextStyle(
          //     color: MaterialTheme.lightScheme().onSurface,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //     fontFamily: 'Roboto',
          //   ),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          const SizedBox(height: 4.0),
          // Nom du restaurant + étoiles
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    imageResto,
                    height: 20.0,
                    width: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                 Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 16,
                    child: FittedBox(
                      fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                      child: Text(
                        nomPlat,/// + screenWidth.toString(),
                        style: TextStyle(
                          color: MaterialTheme.lightScheme().onSurfaceVariant,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ),
                // Expanded(
                //   child: Text(
                //     nomResto,
                //     style: TextStyle(
                //       color: MaterialTheme.lightScheme().onSurfaceVariant,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: 'Roboto',
                //     ),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
              ])),
              Row(
                children: [
                  Icon(Icons.star_rate_rounded,
                      size: 20.0, color: MaterialTheme.lightScheme().error),
                  SizedBox(width: 1.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      star.toString(),
                      style: TextStyle(
                        color: MaterialTheme.lightScheme().onSurface,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Prix + Bouton Commander
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "${prix.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ")} Ar",
                  style: TextStyle(
                    color: MaterialTheme.lightScheme().onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Spacer(),

              ElevatedButton(
                onPressed: showCardDetails,
                child: SvgPicture.asset(
                  'assets/images/commander.svg',
                  width: 26.0,
                  fit: BoxFit.contain,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                // child: Text(
                //   "Commander",
                //   style: TextStyle(fontSize: 14.0),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
