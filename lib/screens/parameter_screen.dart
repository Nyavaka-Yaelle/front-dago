import 'package:flutter/material.dart';
import '../components/parameter_items.dart';
import '../theme.dart';

class ParameterScreen extends StatefulWidget {
  @override
  _ParameterScreenState createState() => _ParameterScreenState();
}

class _ParameterScreenState extends State<ParameterScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isButtonEnabled = false;
  late Color appBarColor;
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
    appBarColor = customColor.getColor("surfaceContainerLowest");
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
    Color appBarColor = customColor.getColor("surfaceContainerLowest"); // Couleur par défaut
    Color bodyColor = customColor.getColor("surfaceContainerLowest"); // Couleur par défaut

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: colorScheme.onSurfaceVariant,
          ), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          'Paramètres', //+colorScheme.primary.toString(),
          style: TextStyle(
              fontFamily:
                  'Roboto', // Exemple de font family, vous pouvez mettre celui que vous préférez
              fontSize: 21.0, // Exemple de taille de police (fontSize)
              color: colorScheme.onSurface), // Couleur du texte (foregroundColor)
        ),
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
              ParameterItems(),
            ],
          ),
        ),
      ),
    );
  }
}
