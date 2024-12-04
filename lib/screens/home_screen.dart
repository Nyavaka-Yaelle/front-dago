import 'package:flutter/material.dart';
import '../components/horizontal_line.dart';
import '../components/services_card.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';  // Ajoutez le chemin vers le BottomNavbar
import '../components/food_cards.dart';  // Ajoutez le chemin vers le BottomNavbar

class HomeScreen extends StatefulWidget {
  final int idService;

  const HomeScreen({
    Key? key,
    this.idService = 0, // Valeur par défaut
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  Color bodyColor = MaterialTheme.lightScheme().surfaceBright;

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
      appBarColor = _scrollController.offset > 10
          ? MaterialTheme.lightScheme().surfaceContainerLow.withOpacity(0.24)
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ServicesCard(),
                SizedBox(height: 12),
                HorizontalLine(
                  color: MaterialTheme.lightScheme().outlineVariant,
                  thickness: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 12, 12),
                  child: Text(
                    'Pour vous',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1,
                      color: MaterialTheme.lightScheme().onPrimaryFixed,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                FoodCards(),
                SizedBox(height: 96),

              ],
            ),
          ),

          // BottomNavbar at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavbar(),  // Votre BottomNavbar
          ),
        ],
      ),
    );
  }
}
