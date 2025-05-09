import 'package:flutter/material.dart';
import '../theme.dart';

class SearchDestination extends StatefulWidget {
  @override
  _SearchDestinationState createState() => _SearchDestinationState();
}

class _SearchDestinationState extends State<SearchDestination> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        height: 48, // Hauteur de la barre de recherche
        decoration: BoxDecoration(
          color: customColor.getColor("surfaceContainerHigh"), // Couleur gris clair
          borderRadius: BorderRadius.circular(100), // Bordure arrondie avec un rayon de 100
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12), // Padding à gauche et à droite
          child: Row(
            children: [
              Icon(
                Icons.arrow_back, // Icône de loupe
                color: colorScheme.onSurfaceVariant,
                size: 20, // Couleur de l'icône
              ),
              SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: TextField(
                    controller: _controller,
                    cursorColor: colorScheme.onSurfaceVariant, // Couleur du curseur
                    decoration: InputDecoration(
                      hintText: 'Choisir une destination',
                      border: InputBorder.none, // Aucun bord autour du champ de texte
                    ),
                  ),
                ),
              ),
              // Utilisation d'un ValueListenableBuilder pour réagir au changement du texte
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _controller,
                builder: (context, value, child) {
                  return value.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            _controller.clear(); // Efface le texte
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 48,
                            height: 48,
                            child: Icon(
                            Icons.close_rounded, // Icône de fermeture
                            size: 18,
                            color: colorScheme.onSurfaceVariant, // Couleur de l'icône
                          )),
                        )
                      : SizedBox.shrink(); // Si le champ est vide, ne rien afficher
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
