import 'package:flutter/material.dart';
import '../theme.dart';

class PackeeInfo extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action

  const PackeeInfo({
    Key? key,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.0025),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/packee.png',
            height: 136.0,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12.0),
        // Titre principal
        Container(
          alignment: Alignment.topCenter,
          height: 32,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Packee',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.secondary,
              ),
            ),
          )
        ),
        // Slogan
        SizedBox(height: 12),
        Container(
          alignment: Alignment.topCenter,
          height: 48,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '“Besoin de récupérer un colis ?\nc’est un clic et c’est réglé.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          )
        ),
        SizedBox(height: 12),
        // Description
        Container(
          alignment: Alignment.topCenter,
          height: 48,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Avec Packee, vos colis sont entre de bonnes mains : \nrécupération rapide et suivi simplifié.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.tertiary,
              ),
            ),
          )
        ),
      ], // color: colorScheme.surfaceContainerLow,
    );
  }
}
