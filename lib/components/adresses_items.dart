import 'package:flutter/material.dart';
import './profile_detail_item.dart';
import '../theme.dart';
class AdressesItems extends StatelessWidget {
  const AdressesItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Adresses", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: MaterialTheme.lightScheme().onSurface),
        ),
        SizedBox(height: 24),
        Text(
          "Vos adresses dans l’application permet de simplifier et d’optimiser vos déplacements et livraisons.", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: MaterialTheme.lightScheme().onPrimaryContainer, fontWeight: FontWeight.w500),
        ),
        Text(
          "Vos informations personnelles restent confidentielles et sécurisées.", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: MaterialTheme.lightScheme().tertiary, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 24),
        Text(
          "Adresses personnelles", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: MaterialTheme.lightScheme().tertiary, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 4),
        ProfileDetailItem(
          icon: Icons.home_rounded,
          title: "Maison",
          detail: "Cité des 67Ha Sud",
        ),
         ProfileDetailItem(
          icon: Icons.work_outline_rounded,
          title: "Bureau",
          detail: "Ajouter une adresse",
          isAdding: true,
        ),
        SizedBox(height: 4),
        Divider(),
        SizedBox(height: 8),
        Text(
          "Restaurants favoris", // Exemple : "2 menus"
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: MaterialTheme.lightScheme().tertiary, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 4),
        ProfileDetailItem(
          icon: Icons.restaurant_rounded,
          title: "Restaurant",
          detail: "Sopera Milomboko",
          isLiking: true,
        ),
        ProfileDetailItem(
          icon: Icons.restaurant_rounded,
          title: "Restaurant",
          detail: "Ajouter une adresse",
          isAdding: true,
        ),
      ]));
  }
}
