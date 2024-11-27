import 'package:flutter/material.dart';
import '../theme.dart';
class AddressOnYourCard extends StatelessWidget {
  final String adresse;
  // final String heure;
  // final String nomLieu;

  const AddressOnYourCard({
    required this.adresse,
    // required this.heure,
    // required this.nomLieu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 0),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     blurRadius: 8.0,
        //     spreadRadius: 2.0,
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Première ligne: icône de localisation, adresse et icône d'édition
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 24,
                    color: MaterialTheme.lightScheme().error,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse de livraison",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Roboto',
                          color: MaterialTheme.lightScheme().onSurfaceVariant,
                        ),
                      ),
                      Text(
                        adresse,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          height: 1.33,
                          color: MaterialTheme.lightScheme().onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                     
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.edit_location_alt_outlined,
                size: 20,
                color: MaterialTheme.lightScheme().onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 8.0), // Espacement entre les lignes

          // Deuxième ligne: icône de détail et texte au centre
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min, // Permet de ne pas étirer la ligne
              children: [
                Icon(
                  Icons.description_outlined,
                  color: MaterialTheme.lightScheme().secondary,
                  size: 16
                ),
                const SizedBox(width: 4.0),
                Text(
                  'Un détails à l\'adresse ?',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontFamily: 'Roboto',
                    color: MaterialTheme.lightScheme().secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
