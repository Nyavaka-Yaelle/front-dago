import 'package:flutter/material.dart';
import '../components/maj/target_information.dart';
import '../components/maj/bill_information.dart';
import '../components/maj/error_information.dart';
import '../components/maj/tertiary_button.dart';
import '../components/maj/info_item_card.dart';
import '../theme.dart';

class CustomComponents extends StatefulWidget {
  const CustomComponents({
    Key? key,
  }) : super(key: key);

  @override
  _CustomComponentsState createState() => _CustomComponentsState();
}

class _CustomComponentsState extends State<CustomComponents> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: customColor.getColor('white'),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: [
                  TargetInformation(),
                  SizedBox(height: 8.0),
                  BillInformation(),
                  ErrorInformation(state: 'config', message: "Veuillez configurer votre wallet"), // Modifier l'état ici
                  TertiaryButton(
                    label: "Configurer mon wallet",
                    icon: Icons.wallet,
                    onClick: () {
                      print("Bouton cliqué !");
                    },
                  ),
                  SizedBox(height: 16.0),
                  InfoItemCard(
                    icon: Icons.wallet,
                    title: "Wallet Virtuel",
                    subtitle: "Paiements fluides, rechargez facilement via Mobile Money.",
                  ),
                  SizedBox(height: 16.0),
                  InfoItemCard(
                    icon: Icons.settings,
                    title: "Configuration du Wallet",
                    subtitle: "Activez votre wallet et achetez en toute simplicité !",
                  ),
                  SizedBox(height: 16.0),
                  InfoItemCard(
                    icon: Icons.shield,
                    title: "Sécurité",
                    subtitle: "Sécurisez chaque transaction grâce à votre code PIN à 4 chiffres.",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: OutlinedButton(
              onPressed: () {
                print("Passer bouton cliqué !");
              },
              child: Text("Passer"),
            ),
          ),
        ],
      ),
    );
  }
}