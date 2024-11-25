import 'package:flutter/material.dart';
import '../theme.dart';
import './service_card.dart';

class ServicesCard extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action

  const ServicesCard({
    Key? key,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.all(12),
      child: Container(
      // color: MaterialTheme.lightScheme().surfaceContainerLow,
        width: MediaQuery.of(context).size.width, // Largeur du container
        height: 120,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceVariant,
          border: Border.all(
            width: 1.0,
            color: MaterialTheme.lightScheme().outlineVariant, // Définit la couleur de la bordure
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)), // Bordure arrondie
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 8, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ServiceCard(label: "Ridee",image:"ridee_service"),
              ServiceCard(label: "Caree",image:"caree_service"),
              ServiceCard(label: "Foodee",image:"foodee_service"),
              ServiceCard(label: "Packee",image:"packee_service"),
              // Texte "Vous n'êtes pas encore connecté"
              // Column(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width/5, // Largeur du container
              //       height: 62,
              //       clipBehavior: Clip.none,
              //       decoration: BoxDecoration(
              //         // color: Theme.of(context).colorScheme.surfaceVariant,
              //         border: Border.all(
              //           width: 1.0,
              //           color: MaterialTheme.lightScheme().onSurfaceVariant, // Définit la couleur de la bordure
              //         ),
              //         borderRadius: const BorderRadius.all(Radius.circular(16)), // Bordure arrondie
              //       ),
              //        child:Align(
              //         alignment: Alignment.center,
              //         child: Image.asset(
              //           'assets/images/ridee_service.png',
              //           height: 30.0,
              //           fit: BoxFit.contain,
              //         ),
              //       ),
              //     ),
              //     SizedBox(height: 8),
              //     Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Ridee",
              //         style: TextStyle(
              //           fontFamily: 'Roboto',
              //           fontSize: 12,
              //           fontWeight: FontWeight.w500,
              //           color: MaterialTheme.lightScheme().onSurface,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ]
          )
        ),
      ),
    );
  }
}
