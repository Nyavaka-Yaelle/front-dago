import 'package:flutter/material.dart';
import 'package:project1/theme.dart';
import 'package:intl/intl.dart';

class BillInformation extends StatelessWidget {
  final double solde;
  final String soldes;
  final String date;

  BillInformation({
    this.solde = 20000,
    Key? key,
  }) : soldes = NumberFormat.currency(locale: 'fr', symbol: 'Ar', decimalDigits: 0).format(solde),
        date = DateFormat('dd MMMM yyyy', 'fr_FR').format(DateTime.now()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    String capitalizedDate = date.replaceFirst(date[3], date[3].toUpperCase());

    return SingleChildScrollView(
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.receipt_rounded, size: 24.0, color: customColor.getColor("white")),
                  SizedBox(width: 8.0),
                  Expanded(  // Ajouté pour étirer l'espace
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Montant de la course',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: customColor.getColor("white"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              capitalizedDate,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 11.0,
                                fontWeight: FontWeight.w300,
                                color: customColor.getColor("white").withOpacity(0.9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.3),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        soldes,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: customColor.getColor("white"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.0), // Espacement entre les lignes
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      (constraints.maxWidth / 6).floor(),
                      (index) => SizedBox(width: 3, child: Divider(color: colorScheme.outline)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
