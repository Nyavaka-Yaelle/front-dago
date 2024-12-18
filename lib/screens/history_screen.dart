import 'package:flutter/material.dart';
import '../components/delivery_item.dart';
import '../theme.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();
 
  Color appBarColor = MaterialTheme.lightScheme().surface; // Couleur par défaut
  Color bodyColor = MaterialTheme.lightScheme().surface; // Couleur par défaut
final List<DeliveryItem> historiques = [
    DeliveryItem(motif:"Ridee" ,title: "7112 TBL", items: "Apeas Lance"),
    DeliveryItem(motif:"Foodee" ,title: "Pakopako", items: "Byriani Akoho"),
    DeliveryItem(motif:"Monee" ,title: "Ajout de fond", items: "20 000Ar"),
    DeliveryItem(motif:"Foodee" ,title: "Pakopako", items: "2 Menus"),
  ];  
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
    // Modifier la couleur selon la position de défilement
    setState(() {
      // appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
      appBarColor = _scrollController.offset > 10
          ? MaterialTheme.lightScheme().surfaceContainerHighest.withOpacity(0.24)
          : MaterialTheme.lightScheme().surface;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor, 
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: MaterialTheme.lightScheme().onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
        title: Text(
          'Historique',
          style: TextStyle(
            fontFamily: 'Roboto', // Exemple de font family, vous pouvez mettre celui que vous préférez
            fontSize: 21.0, // Exemple de taille de police (fontSize)
            color: MaterialTheme.lightScheme().onSurface
          ), // Couleur du texte (foregroundColor)
        ),
        foregroundColor: MaterialTheme.lightScheme().onSurface,        
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        child: Container(
          margin: EdgeInsets.only(top:8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: historiques.asMap().entries.map((entry) {
                final index = entry.key;
                final historique = entry.value;

                return Column(
                  children: [
                    DeliveryItem(
                      motif: historique.motif,
                      title: historique.title,
                      items: historique.items,
                    ),
                  ],
                );
              }).toList(),
            ) 
          ),
        ),
    );
  }
}
