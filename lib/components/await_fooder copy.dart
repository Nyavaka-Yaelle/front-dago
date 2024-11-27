import 'package:flutter/material.dart';
import './custom_button.dart';
import '../theme.dart';

class AwaitFooder extends StatelessWidget {
  final String nomResto;
  final VoidCallback? onPressed; // `VoidCallback?` pour permettre un bouton désactivé

  const AwaitFooder({
    required this.nomResto,
    this.onPressed,
    Key? key, // Ajout d'une clé pour respecter les bonnes pratiques
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().surfaceContainerLowest, // Utilisation de Scaffold pour une structure plus propre
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: mediaQuery.height / 2.5),
          // Roue de chargement
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/loading_wheel.png',
              height: 48.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          // Texte "En attente de nomResto"
          Align(
            alignment: Alignment.center,
            child: Text(
              'En attente de $nomResto',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MaterialTheme.lightScheme().onSurface,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Sous-texte d'attente
          Align(
            alignment: Alignment.center,
            child: Text(
              'Vous serez notifié de l\'état de votre commande',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: MaterialTheme.lightScheme().secondary,
              ),
              textAlign: TextAlign.center, // Centrage du texte
            ),
          ),
          const Spacer(),
          // Bouton en bas
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: CustomButton(
              label: "Découvrez d'autres délices",
              outline: true,
              color: Colors.transparent,
              onPressed: onPressed ??
                  () {
                    // Gestion d'une fonction par défaut si `onPressed` est null
                    print("Naviguer vers d'autres délices");
                  },
            ),
          ),
        ],
      ),
    );
  }
}
