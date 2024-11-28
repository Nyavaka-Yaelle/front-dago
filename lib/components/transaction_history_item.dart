import 'package:flutter/material.dart';
import '../theme.dart';
class TransactionHistoryItem extends StatelessWidget {
  final double amount;
  final String label;
  final VoidCallback? onTap;
  bool transactionIn;

  TransactionHistoryItem({
    required this.amount,
    required this.label,
    this.onTap,
    this.transactionIn = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        // decoration: BoxDecoration(
        //   border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icône à gauche
            Row(
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   color: Colors.blue.shade100, // Couleur d'arrière-plan de l'icône
                  // ),
                  child: Icon(
                    Icons.account_balance_wallet_outlined, // Exemple d'icône
                    size: 32.0,
                    color: transactionIn? 
                      MaterialTheme.lightScheme().secondary:
                      MaterialTheme.lightScheme().error,
                  ),
                ),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${amount.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ")} Ar",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: transactionIn? 
                          MaterialTheme.lightScheme().onSurface:
                          MaterialTheme.lightScheme().onErrorContainer,
                          height: 1.5
                      ),
                    ),
                    Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: transactionIn? 
                          MaterialTheme.lightScheme().tertiary:
                          MaterialTheme.lightScheme().onErrorContainer,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.rotate(
              angle: transactionIn? 3.14159: 0.0, // 180 degrés en radians
              child: Icon(
                Icons.arrow_outward_rounded, // Icône flèche sortante
                size: 24.0,
                color: transactionIn? MaterialTheme.lightScheme().primary: MaterialTheme.lightScheme().error,
              ),
            )
          ],
        ),
      ),
    );
  }
}
