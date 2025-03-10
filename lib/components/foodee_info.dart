import 'package:flutter/material.dart';
import '../theme.dart';

class FoodeeInfo extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action

  const FoodeeInfo({
    Key? key,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/foodee.png',
            height: 132.0,
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
              'Foodee',
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
              '“Choisissez, commandez, et savourez \nen quelques clics.”',
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
              'Avec Foodee, commandez vos plats préférés et\nfaites-les livrer en toute simplicité, où que vous soyez.',
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
