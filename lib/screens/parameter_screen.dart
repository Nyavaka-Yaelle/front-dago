import 'package:flutter/material.dart';
import '../components/parameter_items.dart';
import '../theme.dart';

class ParameterScreen extends StatefulWidget {
  @override
  _ParameterScreenState createState() => _ParameterScreenState();
}

class _ParameterScreenState extends State<ParameterScreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
  bool isButtonEnabled = false;
  
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
          ? MaterialTheme.lightScheme().surfaceContainerLow.withOpacity(0.24)
          : MaterialTheme.darkScheme().surfaceContainerLowest;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:  bodyColor, 
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
          'Paramètres',
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
        child: Padding(
          // padding: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ParameterItems(),
            ],
          ),
        ),
      ),
    );
  }
}
