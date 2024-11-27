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
    return Container(
      // width: MediaQuery.of(context).size.width/2.5 ,
      width: MediaQuery.of(context).size.width/2 -12-3,
      // height: 200,
      // margin: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
          // Nom du plat
          Text(
            nomPlat,
            style: TextStyle(
              color: MaterialTheme.lightScheme().onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4.0),
          // Nom du restaurant + étoiles
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child:
                Row(
                  children: [
                    Image.asset(
                      imageResto,
                      height: 20.0,
                      width: 20.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        nomResto,
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
                  ]
                )
              ),
              Row(
                children: [
                  Icon(Icons.star_rate_rounded, size: 20.0, color: Colors.red),
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
                  style: 
                TextStyle(
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
                    backgroundColor: MaterialTheme.lightScheme().surfaceContainerLowest,
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
