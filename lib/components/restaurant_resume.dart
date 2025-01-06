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
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Container(
      height: 40, // Hauteur du container
      padding: EdgeInsets.symmetric(horizontal: 10), // Padding horizontal
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant, // Couleur de fond
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
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    star.toString(),
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
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
                    color: colorScheme.error,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    lieu, // Adresse
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
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
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    minutes.toInt().toString()+' mn', // Temps
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
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
