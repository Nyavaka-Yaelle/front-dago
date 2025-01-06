import 'package:flutter/material.dart';
import './custom_toggle_switch.dart';
import '../theme.dart';
class ParameterItems extends StatelessWidget {
  const ParameterItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(top:16),
      child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Langue d'affichage", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.tertiary),
        ),
        SizedBox(height: 8),
        Text(
          "Langues", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.w500),
        ),
        Text(
          "Français (France)", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: colorScheme.secondary, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text(
          "Apparence", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: colorScheme.tertiary),
        ),
        SizedBox(height: 4),
        Row(children: [
          Expanded(child:
            Text(
              "Mode sombre", // Exemple : "2 menus"
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.normal),
            )
          ),
          Container(
              height: 28, // Spécifiez une hauteur suffisante pour le divider
              width: 24, // Spécifiez une hauteur suffisante pour le divider
              child: VerticalDivider(
                color: colorScheme.outlineVariant,
                thickness: 1, // Épaisseur du divider
                width: 16, // Espace entre les éléments
              ),
            ),
          CustomToggleSwitch(),
        ])
      ],
    ));
  }
}
