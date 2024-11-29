import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import '../components/horizontal_line.dart';
import '../theme.dart';

class AddFundScreen extends StatefulWidget {
  @override
  _AddFundScreenState createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController montantController = TextEditingController();
  bool memorizeNumber = false;
  bool isButtonEnabled = false;
  double selectedAmount = -1; // Variable pour stocker le montant sélectionné

  @override
  void initState() {
    super.initState();
    numeroController.addListener(_updateButtonState);
    montantController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    numeroController.dispose();
    montantController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      double? parsedValue =
          double.tryParse(montantController.text.replaceAll(' ',''));

      isButtonEnabled = numeroController.text.length>=13 &&
          montantController.text.isNotEmpty &&
          parsedValue != null &&
          parsedValue >= 1000;
      selectedAmount = parsedValue!=null? parsedValue: -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().surfaceContainerLowest,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: 24.0, color: MaterialTheme.lightScheme().onSurfaceVariant),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: MaterialTheme.lightScheme().surfaceContainerLowest,
        elevation: 0,
        title: Text(
          'Ajout de fonds',
          style: TextStyle(
            fontSize: 21.0,
            color: MaterialTheme.lightScheme().onSurface,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Champ de numéro de téléphone
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Numéro de téléphone",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MaterialTheme.lightScheme().onSurface,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CustomInput(
                        hintText: "Numéro de téléphone",
                        labelText: "Numéro",
                        controller: numeroController,
                        isNumero: true,
                        isLabel: false,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Image.asset(
                        'assets/images/mvola.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Checkbox(
                      value: memorizeNumber,
                      onChanged: (value) {
                        setState(() {
                          memorizeNumber = value ?? false;
                        });
                      },
                      side: BorderSide(
                        color: memorizeNumber
                            ? MaterialTheme.lightScheme().primary
                            : MaterialTheme.lightScheme().secondary,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      checkColor: MaterialTheme.lightScheme().onPrimary,
                      activeColor: MaterialTheme.lightScheme().primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    Text(
                      "Mémoriser ce numéro",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: MaterialTheme.lightScheme().secondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                HorizontalLine(
                  color: MaterialTheme.lightScheme().outlineVariant,
                  thickness: 1.0,
                ),
                const SizedBox(height: 16),
                Text(
                  "Montant",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: MaterialTheme.lightScheme().onSecondaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                CustomInput(
                  hintText: "Entrez le montant",
                  labelText: "Montant",
                  controller: montantController,
                  isNumber: true,
                  isLabel: false,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_rounded,
                          size: 16,
                          color: MaterialTheme.lightScheme().tertiary),
                      const SizedBox(width: 4),
                      Text(
                        "Ajout de fond minimum pour 1 000 AR",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: MaterialTheme.lightScheme().tertiary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [2000.0, 5000.0, 10000.0, 20000.0].map((amount) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedAmount = amount;
                            montantController.text = amount.toString();
                            _updateButtonState();
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 6),
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                          foregroundColor: selectedAmount == amount
                              ? MaterialTheme.lightScheme().onSecondaryContainer
                              : MaterialTheme.lightScheme().onSurfaceVariant,
                          side: BorderSide(
                            width: 0.5,
                            color: selectedAmount == amount
                                ? MaterialTheme.lightScheme().secondaryContainer
                                : MaterialTheme.lightScheme()
                                    .onSurfaceVariant
                                    .withOpacity(0.8),
                          ),
                          backgroundColor: selectedAmount == amount
                              ? MaterialTheme.lightScheme().secondaryContainer
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selectedAmount == amount)
                              Icon(
                                Icons.check,
                                size: 14,
                                color: MaterialTheme.lightScheme()
                                    .onSecondaryContainer,
                              ),
                            if (selectedAmount == amount)
                              SizedBox(
                                width: 4,
                              ),
                            Text(
                              "${amount.toInt().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ")}",
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          label: "Ajouter des fonds",
          isDisabled: !isButtonEnabled,
          onPressed: isButtonEnabled
              ? () {
                  print("Fonds ajoutés");
                }
              : null,
          color: MaterialTheme.lightScheme().primary,
        ),
      ),
    );
  }
}
