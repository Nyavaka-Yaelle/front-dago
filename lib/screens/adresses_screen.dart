import 'package:flutter/material.dart';
import '../components/adresses_items.dart';
import '../theme.dart';

class AdressesScreen extends StatefulWidget {
  @override
  _AdressesScreenState createState() => _AdressesScreenState();
}

class _AdressesScreenState extends State<AdressesScreen> {
  final ScrollController _scrollController = ScrollController();
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customColor = ColorManager(context);
    appBarColor = customColor.getColor("surfaceContainerLowest");
    bodyColor = customColor.getColor("surfaceContainerLowest");
  }
  void _onScroll() {
    // Modifier la couleur selon la position de défilement
    setState(() {
      // appBarColor = colorScheme.surfaceContainerLowest;
      appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
          : customColor.getColor("surfaceContainerLowest");
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor, 
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: colorScheme.onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
        foregroundColor: colorScheme.onSurface,        
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        child: Padding(
          // padding: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AdressesItems(),
            ],
          ),
        ),
      ),
    );
  }
}
