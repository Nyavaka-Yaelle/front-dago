import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import '../components/address_position.dart';
import '../theme.dart';

class FoodeeHomeScreen extends StatefulWidget {
  final int idService;

  const FoodeeHomeScreen({
    Key? key,
    this.idService = 0, 
    // Valeur par défaut
  }) : super(key: key);

  @override
  _FoodeeHomeScreenState createState() => _FoodeeHomeScreenState();
}

class _FoodeeHomeScreenState extends State<FoodeeHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;

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
          ? MaterialTheme.lightScheme().surfaceContainerLowest
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, size: 24.0),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   backgroundColor: appBarColor,
      // ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                AddressPosition(
                  iconPath: "assets/images/location_on.png", // Chemin vers l'icône
                  title: "Votre position",
                  subtitle: "3GMQ 8H6, Antananarivo",
                  imagePath: "assets/images/foodee_service.png", // Chemin vers l'image
                ),
              // SizedBox(height: 4),
              SearchBar(),
            ],
          ),
        ),
    );
  }
}
