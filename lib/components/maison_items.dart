import 'package:flutter/material.dart';
import './profile_detail_item.dart';
import './text_icon_button.dart';
import '../theme.dart';
class MaisonItems extends StatelessWidget {
  const MaisonItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Container(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Maison", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface),
        ),
        SizedBox(height: 24),
        Text(
          "Votre adresse de maison facilite des livraisons précises et rapides.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onPrimaryContainer, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        ),
        SizedBox(height: 4),
        Text(
          "Vos informations personnelles restent confidentielles et sécurisées.", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: colorScheme.tertiary, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 20),
        ProfileDetailItem(
          icon: Icons.home_rounded,
          title: "Maison",
          detail: "Cité des 67Ha Sud",
          isEditing: true,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TextIconButton(label: "Ajouter une adresse de maison", icon: Icons.add, color: colorScheme.primary)]
        )
      ]));
  }
}
