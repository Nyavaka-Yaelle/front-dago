import 'package:flutter/material.dart';
import '../screens/page_info.dart';
import '../theme.dart';

class ServiceCard extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action
  final int state;
  final int idService;
  final String image;
  final String label;
  const ServiceCard({
    Key? key,
    this.image = 'ridee_service',
    this.label = 'Ridee',
    this.onActionTap,
    this.idService = 0,
    this.state = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // ColorManager customColor = ColorManager(context);
    ColorManager colorManager = ColorManager(context);

    if (MediaQuery.of(context).size.width <= 500) {
      return GestureDetector(
          onTap: () {
            // Action lors du tap, par exemple naviguer vers PageInfo avec idService
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageInfo(idService: this.idService),
              ),
            );
          },
          child: Container(
            height: 86,
            child: Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 4) -20, 
                  height: 62,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.surfaceVariant,
                    border: Border.all(
                      width: 0.5,
                      color: colorScheme
                          .onSurfaceVariant, // Définit la couleur de la bordure
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(16)), // Bordure arrondie
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/' + image + '.png',
                      height: label == 'Ridee' ? 30.0 : 48.0,
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
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Container(
        height: 86,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width / 4) -20, 
              height: 48,
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.surfaceVariant,
                border: Border.all(
                  width: 0.5,
                  color: colorScheme
                      .onSurfaceVariant, // Définit la couleur de la bordure
                ),
                borderRadius: const BorderRadius.all(
                    Radius.circular(16)), // Bordure arrondie
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/' + image + '.png',
                      height: label == 'Ridee' ? 24.0 : 40.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                SizedBox(width: 8),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    //+" "+MediaQuery.of(context).size.width.toString(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                )]
              ),
            ),
          ],
        ),
      );
    }
  }
}
