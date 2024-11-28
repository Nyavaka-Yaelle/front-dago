import 'package:flutter/material.dart';
import '../theme.dart';
class FundAddedSuccess extends StatelessWidget {
  final String amount;
  final String dateTime;
  final String addedBy;
  final String phoneNumber;
  final String paymentMethod;
  final String newBalance;

  const FundAddedSuccess({
    required this.amount,
    required this.dateTime,
    required this.addedBy,
    required this.phoneNumber,
    required this.paymentMethod,
    required this.newBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9, // 90% de la largeur
            padding: const EdgeInsets.fromLTRB(14, 48, 14, 20),
            decoration: BoxDecoration(
              color: MaterialTheme.lightScheme().surface,
              border: Border.all(color: MaterialTheme.lightScheme().outlineVariant.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icône centrale
                Icon(
                  Icons.check_circle_rounded,
                  size: 64,
                  color: MaterialTheme.lightScheme().primary,
                ),
                const SizedBox(height: 8),
                // Message principal
                Text(
                  "Votre fond ajouté avec succès",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().secondary,
                    letterSpacing: 0.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  amount,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().tertiary,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(height: 24),
                // Informations sur l'ajout
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fond ajouté par :",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MaterialTheme.lightScheme().secondary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        addedBy,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: MaterialTheme.lightScheme().onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Expanded(
                          //   child: Text(
                          //     addedBy,
                          //     style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                             fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: MaterialTheme.lightScheme().onSurface,
                            letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Image.asset(
                            'assets/images/mvola.png', // Chemin vers l'image Mvola
                            // width: 48,
                            height: 12,
                            fit: BoxFit.contain,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),
                // Nouveau solde
                Text(
                  "Votre nouveau solde est",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: MaterialTheme.lightScheme().secondary,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  newBalance,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Bouton Close en haut à droite
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue ou autre action
              },
              child: Icon(
                Icons.close,
                size: 24,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
