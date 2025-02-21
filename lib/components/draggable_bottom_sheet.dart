import 'package:flutter/material.dart';
import '../theme.dart';

class DraggableBottomSheet extends StatelessWidget {
  final String depart;

  DraggableBottomSheet({
    required this.depart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return 
     DraggableScrollableSheet(
              initialChildSize: 0.3, // Taille initiale (30% de l'écran)
              minChildSize: 0.1, // Taille minimale du BottomSheet (10% de l'écran)
              maxChildSize: 0.8, // Taille maximale du BottomSheet (80% de l'écran)
              builder: (BuildContext context, scrollController) {
                return Container(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                  decoration: BoxDecoration(
                    color: customColor.getColor("surfaceContainerLow"),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.26),
                        blurRadius: 8,
                        spreadRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController, // Permet de gérer le défilement
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Drag Handle
                        Center(
                          child: Container(
                            width: 32,
                            height: 4,
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: colorScheme.outline,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Votre position", style: TextStyle(
                          fontSize: 14, 
                          fontFamily: 'Roboto', 
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        )),
                        SizedBox(height: 4),
                        Text(depart, style: TextStyle(
                          fontSize: 16, 
                          fontFamily: 'Roboto', 
                          fontWeight: FontWeight.w500,
                          color: colorScheme.primary,
                        )),
                      ],
                    ),
                  ),
                );
              },
            );
    }
}
