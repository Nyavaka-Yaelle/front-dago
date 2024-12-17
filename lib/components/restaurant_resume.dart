import 'package:flutter/material.dart';
import '../theme.dart';

class RestaurantResume extends StatelessWidget {
  final double? star;
  final String lieu;
  final double minutes;
  const RestaurantResume({
    this.star = 0,
    this.lieu = "Antananarivo",
    this.minutes = 15,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Hauteur du container
      padding: EdgeInsets.symmetric(horizontal: 10), // Padding horizontal
      decoration: BoxDecoration(
        color: MaterialTheme.lightScheme().surfaceVariant, // Couleur de fond
        borderRadius: BorderRadius.circular(8), // Bordure arrondie
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Espacement entre les éléments
        children: [
          // Icône étoile et texte
           Expanded( child: Container(
            alignment: Alignment.center,
            height: 22,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
              child:
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    size: 20.0,
                    color: MaterialTheme.lightScheme().primary,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    star.toString(),
                    style: TextStyle(
                      color: MaterialTheme.lightScheme().onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              )
          ))),
          Expanded( child: Container(
            alignment: Alignment.center,
            height: 22,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
              child:
          // Icône de localisation et texte
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded, // Icône localisation
                    color: MaterialTheme.lightScheme().error,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    lieu, // Adresse
                    style: TextStyle(
                      color: MaterialTheme.lightScheme().onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              )
            ))),

          // Icône horloge et texte
          Expanded( child: Container(
            alignment: Alignment.center,
            height: 22,
            child: FittedBox(
              fit: BoxFit.scaleDown, // Shrinks text to fit within the container
              child: Row(
                children: [
                  Icon(
                    Icons.alarm, // Icône horloge
                    color: MaterialTheme.lightScheme().primary,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    minutes.toInt().toString()+' mn', // Temps
                    style: TextStyle(
                      color: MaterialTheme.lightScheme().onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            )
          ))
        ],
      ),
    );
  }
}
