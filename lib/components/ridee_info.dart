import 'package:flutter/material.dart';
import '../theme.dart';

class RideeInfo extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action

  const RideeInfo({
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
            'assets/images/ridee.png',
            height: 136.0,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          alignment: Alignment.topCenter,
          height: 32,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
            child: Text(
            'Ridee',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.secondary,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          alignment: Alignment.topCenter,
          height: 48,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
            child: Text(
              '“Des trajets sûrs, simples et un paiement \nqui s\'adapte à votre quotidien.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          alignment: Alignment.topCenter,
          height: 48,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text to fit within the container
            child: Text(
              'Vos itinéraires, votre rythme : avec Ridee, gérez des trajets\n multipoints et réservez un taxi-moto en un clin d’œil.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: colorScheme.tertiary,
              ),
            ),
          ),
        ),
      ], // color: colorScheme.surfaceContainerLow,
    );
  }
}
