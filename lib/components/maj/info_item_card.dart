import 'package:flutter/material.dart';
import 'dart:math' as math;

class InfoItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoItemCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: double.infinity, // Remplir la largeur disponible
            padding: EdgeInsets.fromLTRB(78,0,16,16),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outlineVariant), // Bordure avec la couleur outline
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12), // Espace pour éviter le chevauchement de l'icône
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14, color: colorScheme.onPrimaryContainer),
                  ),
                ),
                SizedBox(height: 5),
               
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child: 
                  Text(
                    subtitle,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: colorScheme.tertiary),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                  ),
                // ),
              ],
            ),
          ),
          Positioned(
            left: -15,
            top: -15,
            child: Transform.rotate(
              angle: -math.pi / 5.625, // 32 degrés
              child: Container(
                // width: 36,
                // height: 36,
                decoration: BoxDecoration(
                  // color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 77, color: colorScheme.tertiaryContainer),
              ),
            ),
          ),
        ],
      ),
    );
  }
}