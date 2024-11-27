import 'package:flutter/material.dart';
import 'package:project1/components/plat_details_on_your_card.dart';
import 'package:project1/components/price_details_on_your_card.dart';
import '../components/address_on_your_card.dart';
import '../components/horizontal_line.dart';
import '../theme.dart';
import '../components/resto_on_your_card.dart';

class YourCardSreen extends StatefulWidget {
  const YourCardSreen({Key? key}) : super(key: key);

  @override
  _YourCardSreenState createState() => _YourCardSreenState();
}

class _YourCardSreenState extends State<YourCardSreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLow;
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLow;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 50
          ? MaterialTheme.lightScheme().surfaceContainerLow
          : MaterialTheme.lightScheme().surfaceContainerLow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: MaterialTheme.lightScheme().surface,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: MaterialTheme.lightScheme().onSurfaceVariant,
          ), // Flèche "Retour"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // backgroundColor: appBarColor,
        backgroundColor: MaterialTheme.lightScheme().surface,

        elevation: 0,
        title: Text(
          'Votre panier',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22.0,
            color: MaterialTheme.lightScheme().onSurface,
          ),
        ),
      ),
      body: Column( // Utilisation de Column avec Expanded
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RestoOnYourCard(
                        nomResto: "Pakopako", description: "Cuisine traditionnelle de Majunga"),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: HorizontalLine(
                          color: MaterialTheme.lightScheme().outlineVariant, thickness: 0.5),
                    ),
                    AddressOnYourCard(adresse: "3GMQ 8H6, Antananarivo"),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: HorizontalLine(
                          color: MaterialTheme.lightScheme().outlineVariant, thickness: 0.5),
                    ),
                    PlatDetailOnYourCard(nomPlat: "Atin'ny coucou",prix: 15000.0)
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Logique pour ajouter un plat
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left:12), // Retirer les bordures
              minimumSize: Size(0, 100), // Minimiser la taille du bouton
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add, // Icône +
                  size: 18,
                  color: MaterialTheme.lightScheme().primary, // Couleur de l'icône
                ),
                SizedBox(width: 8),
                Text(
                  'Ajouter un plat',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: MaterialTheme.lightScheme().primary, // Couleur du texte
                  ),
                ),
              ],
            ),
          ),
          // Le widget PriceDetailsOnYourCard est maintenant en bas
          PriceDetailsOnYourCard(
            sousTotal: 15000,
            emballage: 3000,
            fraisLivraison: 7000,
          ),
        ],
      ),
    );
  }
}
