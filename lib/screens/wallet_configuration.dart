import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/logo_button.dart';
import '../components/horizontal_line.dart';
import '../components/transaction_history_item.dart';

class WalletConfiguration extends StatefulWidget {
  @override
  _WalletConfigurationState createState() => _WalletConfigurationState();
}

class _WalletConfigurationState extends State<WalletConfiguration> {
  final ScrollController _scrollController = ScrollController();
  final List<TransactionHistoryItem> transactions1 = [];
  final List<TransactionHistoryItem> transactions = [
    TransactionHistoryItem(
        amount: 20000, label: "Ajout de fonds", transactionIn: true),
    TransactionHistoryItem(
        amount: 20000, label: "Rider Services", transactionIn: false),
    // TransactionHistoryItem( amount: 20000, label: "Rider Services", transactionIn: false),
    // TransactionHistoryItem( amount: 20000, label: "Rider Services", transactionIn: false),
  ];
  // Color mainColor = colorScheme.surface;
  bool showPaymentOption = false;

  Color getMainColor(ColorScheme colorScheme) {
    return showPaymentOption
        ? colorScheme.scrim.withOpacity(0.32)
        : colorScheme.surface;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    double screenwidth = MediaQuery.of(context).size.width;
    double paddingRight = screenwidth >= 350 ? screenwidth / 2 - 154 : 24;
    double paddingTop = screenwidth < 300 ? 46 : 36;
    double heightMtn = screenwidth < 300 ? 24 : 28;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: getMainColor(colorScheme),
        elevation: 0,
        title: Text(
          'Wallet',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 21.0,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 24.0,
              color: colorScheme.onSurfaceVariant,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Filtre semi-transparent
          Container(
            color: getMainColor(colorScheme), // Filtre noir 20% d'opacité
          ),
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 0.0),
                // Carte Wallet
                Card(
                  // color: colorScheme.surface,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0.0,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/images/wallet_card.png',
                          height: 169.0,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(paddingRight, paddingTop, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: heightMtn,
                              child: FittedBox(
                                fit: BoxFit.scaleDown, // Shrinks text to fit within the container
                                child: Text(
                                  "0.00 Ar",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        colorScheme.onPrimary,
                                  ),
                                ),
                              )),
                            SizedBox(height: 60-paddingTop+36),
                            Text(
                              "Nom de l'utilisateur",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Ajouter des fonds cliqué !");
                        setState(() {
                          showPaymentOption = !showPaymentOption;
                        });
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: showPaymentOption
                              ? customColor.getColor("tertiaryFixed")
                                  .withOpacity(0.16)
                              : customColor.getColor("tertiaryFixed"),
                        ),
                        child: Icon(
                          Icons.add,
                          color: showPaymentOption
                              ? customColor.getColor("onTertiaryFixed")
                                  .withOpacity(0.48)
                              : customColor.getColor("onTertiaryFixed"),
                          size: 24.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 6.0), // Espacement entre le bouton et le label
                    Text(
                      "Ajouter des fonds",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: showPaymentOption
                            ? colorScheme
                                .tertiary
                                .withOpacity(0.48)
                            : colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),

                // Historique des transactions
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            "Historique des transactions",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15.5,
                              fontWeight: FontWeight.w500,
                              color: showPaymentOption
                                  ? customColor.getColor("onSecondaryFixed")
                                      .withOpacity(0.48)
                                  : customColor.getColor("onSecondaryFixed")
                            ),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(height: 8),
                      Center(
                        child: Container(
                          width: double.infinity,
                          // height: transactions.length == 0? 136 : 0.0,
                          decoration: BoxDecoration(
                            // color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: showPaymentOption
                                  ? colorScheme
                                      .outlineVariant
                                      .withOpacity(0.24)
                                  : colorScheme.outlineVariant,
                            ),
                          ),
                          child: transactions.length == 0
                              ? Container(
                                  height: 136,
                                  child: Center(
                                      child: Text(
                                    'Aucune historique',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 13.5,
                                      letterSpacing: 0.24,
                                      color: showPaymentOption
                                          ? customColor.getColor("onSecondaryFixedVariant")
                                              .withOpacity(0.48)
                                          : customColor.getColor("onSecondaryFixedVariant")
                                    ),
                                  )),
                                )
                              : Padding(
                                  padding: EdgeInsets.fromLTRB(4, 6, 4, 10),
                                  child: Opacity(
                                    opacity: showPaymentOption
                                        ? 0.5
                                        : 1, // Opacité de 50%, tu peux ajuster cette valeur
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minHeight:
                                              118), // Hauteur minimale de 136
                                      child: Column(
                                        children: transactions
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          final index = entry.key;
                                          final transaction = entry.value;

                                          return Column(
                                            children: [
                                              TransactionHistoryItem(
                                                amount: transaction.amount,
                                                label: transaction.label,
                                                transactionIn:
                                                    transaction.transactionIn,
                                              ),
                                              if (index <
                                                  transactions.length - 1)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 24,
                                                      right: 24,
                                                      top: 4),
                                                  child: HorizontalLine(
                                                    color: MaterialTheme
                                                            .lightScheme()
                                                        .outlineVariant,
                                                    thickness: 0.5,
                                                  ), // Ajout d'un Divider sauf pour le dernier élément
                                                ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Boutons dans Positioned
          if (showPaymentOption)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // height: ,
                decoration: BoxDecoration(
                  color: customColor.getColor("surfaceContainerLow"),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(36, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(0, -1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 32,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(height: 8),
                      LogoButton(
                        text: "Mvola",
                        logo: "assets/images/mvola.png",
                        width: 48,
                        onPressed: () => {},
                      ),
                      const SizedBox(height: 8),
                      LogoButton(
                        text: "Orange Money",
                        logo: "assets/images/orange.png",
                        width: 22,
                        onPressed: () => {},
                      ),
                      const SizedBox(height: 8),
                      LogoButton(
                        text: "Airtel Money",
                        logo: "assets/images/airtel.png",
                        width: 22,
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
