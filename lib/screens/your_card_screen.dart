import 'package:flutter/material.dart';
import '../components/plat_details_on_your_card.dart';
import '../components/price_details_on_your_card.dart';
import '../components/address_on_your_card.dart';
import '../components/horizontal_line.dart';
import '../theme.dart';
import '../components/resto_on_your_card.dart';

class YourCardScreen extends StatefulWidget {
  const YourCardScreen({Key? key}) : super(key: key);

  @override
  _YourCardScreenState createState() => _YourCardScreenState();
}

class _YourCardScreenState extends State<YourCardScreen> {
  final ScrollController _scrollController = ScrollController();
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customColor = ColorManager(context);
    appBarColor = customColor.getColor("surfaceContainerLow");
    bodyColor = customColor.getColor("surfaceContainerLow");
  }
  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainer")
          : customColor.getColor("surfaceContainerLow");

    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
          ), // Flèche "Retour"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // backgroundColor: appBarColor,
        backgroundColor: colorScheme.surface,

        elevation: 0,
        title: Text(
          'Votre panier',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22.0,
            color: colorScheme.onSurface,
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
                          color: colorScheme.outlineVariant, thickness: 0.5),
                    ),
                    AddressOnYourCard(adresse: "3GMQ 8H6, Antananarivo"),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: HorizontalLine(
                          color: colorScheme.outlineVariant, thickness: 0.5),
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
                  color: colorScheme.primary, // Couleur de l'icône
                ),
                SizedBox(width: 8),
                Text(
                  'Ajouter un plat',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary, // Couleur du texte
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
