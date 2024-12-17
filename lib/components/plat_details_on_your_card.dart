import 'package:flutter/material.dart';
import './custom_input_number.dart';
import '../theme.dart';

class PlatDetailOnYourCard extends StatelessWidget {
  final String nomPlat;
  final String imagePlat;
  final double prix;

  const PlatDetailOnYourCard({
    required this.nomPlat,
    this.imagePlat = 'assets/images/menu_image.png',
    required this.prix,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligner tout en haut
        children: [
          // Image du plat
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePlat), // Image du plat
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          // Informations du plat (Nom et prix)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte à gauche
              children: [
                Text(
                  nomPlat,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${prix.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ")} Ar",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().onSurface,
                  ),
                ),
              ],
            ),
          ),
          // Icône Time (en haut à droite)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 56),
                child:
                Icon(
                  Icons.close_outlined,
                  color: MaterialTheme.lightScheme().onSurfaceVariant,
                  size: 20,
                )
              ),
              SizedBox(height: 4),
              // Input type number pour ajuster la quantité
              Padding(
                padding: EdgeInsets.only(top:24, right: 12),
                child: CustomInputNumber(
                  initialValue: 0,
                  onChanged: (newValue) {
                    print('La nouvelle quantite est : $newValue');
                  }
                )
              )
             ],
          ),
        ],
      ),
    );
  }
}
