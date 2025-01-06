import 'package:flutter/material.dart';
import '../components/await_fooder.dart';
import './custom_button.dart';
import '../theme.dart';
class PriceDetailsOnYourCard extends StatelessWidget {
  final double sousTotal;
  final double emballage;
  final double fraisLivraison;

  // Calcul du total
  double get total => sousTotal + emballage + fraisLivraison;

  const PriceDetailsOnYourCard({
    required this.sousTotal,
    required this.emballage,
    required this.fraisLivraison,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     blurRadius: 8.0,
        //     spreadRadius: 2.0,
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sous-total
          _buildPriceRow(context, 'Sous-total', sousTotal),
          // const Divider(),

          // Emballage
          _buildPriceRow(context, 'Emballage', emballage),
          // const Divider(),

          // Frais de livraison
          _buildPriceRow(context, 'Frais de livraison', fraisLivraison),
          const Divider(),

          // Total
          _buildPriceRow(context, 'TOTAL', total, isTotal: true),

          SizedBox(height: 16),
          CustomButton(
              label: "Passer la commande", 
              color: colorScheme.primary,
              onPressed: () {
                print("Atendre validation");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AwaitFooder(nomResto: "Pakopako",)),
                );
              },
            ),
        ],
      ),
    );
  }

  // Widget pour construire une ligne de prix
  Widget _buildPriceRow(BuildContext context, String label, double value, {bool isTotal = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: isTotal ? 16: 12.0,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: isTotal ?Colors.black: colorScheme.secondary.withOpacity(0.9) ,

            ),
          ),
          Text(
            "${value.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ")} Ar",
            // '${value.toStringAsFixed(0)} Ar', // Affichage du montant avec 'FCFA'
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14.0,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: isTotal ?Colors.black: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
