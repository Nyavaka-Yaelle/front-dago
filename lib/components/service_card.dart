import 'package:flutter/material.dart';
import '../screens/page_info.dart';
import '../theme.dart';

class ServiceCard extends StatelessWidget {
  final VoidCallback? onActionTap; // Callback pour l'action
  final int idService;
  final String image;
  final String label;
  const ServiceCard({
    Key? key,
    this.image = 'ridee_service',
    this.label = 'Ridee',
    this.onActionTap,
    this.idService = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Row(
        children: [
          // SizedBox(width: MediaQuery.of(context).size.width *0.018), 
          // SizedBox(width: 12), 
          Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width / 4) -20, // Largeur du container
                height: 62,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.surfaceVariant,
                  border: Border.all(
                    width: 0.5,
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
        ],
      )
    );
  }
}
