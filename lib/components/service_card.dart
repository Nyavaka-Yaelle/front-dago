import 'package:flutter/material.dart';
import '../theme.dart';

class ServiceCard extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action
  final String image;
  final String label;
  const ServiceCard({
    Key? key,
    this.image = 'ridee_service',
    this.label = 'Ridee',
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5, // Largeur du container
              height: 62,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.surfaceVariant,
                border: Border.all(
                  width: 1.0,
                  color: MaterialTheme.lightScheme()
                      .onSurfaceVariant, // Définit la couleur de la bordure
                ),
                borderRadius:
                    const BorderRadius.all(Radius.circular(16)), // Bordure arrondie
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/'+image+'.png',
                  height: label == 'Ridee' ? 30.0: 48.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: MaterialTheme.lightScheme().onSurface,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width *0.016),  
      ],
    );
  }
}
