import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';
import './custom_button.dart';
import './horizontal_line.dart';
import '../theme.dart';

class ServicesCard extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action

  const ServicesCard({
    Key? key,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MaterialTheme.lightScheme().surfaceContainerLow,
      width: MediaQuery.of(context).size.width, // Largeur du container
      height: 128,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: MaterialTheme.lightScheme().surfaceContainerLow,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), // Rayon en haut à gauche
          topRight: Radius.circular(20),  // Pas de rayon en haut à droite
          bottomLeft: Radius.circular(0), // Rayon en bas à gauche
          bottomRight: Radius.circular(0), // Pas de rayon en bas à droite
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.24), // Couleur de l'ombre
            blurRadius: 2, // Rayon de flou
            offset: Offset(0, 0), // Décalage horizontal et vertical
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Texte "Vous n'êtes pas encore connecté"
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ridee",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MaterialTheme.lightScheme().onSurface,
                ),
              ),
            ),
            const SizedBox(height: 32), // Espace entre le texte et le bouton

          ],
        ),
      ),
    );
  }
}
