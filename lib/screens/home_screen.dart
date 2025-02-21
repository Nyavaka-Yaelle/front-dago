import 'package:flutter/material.dart';
import '../components/horizontal_line.dart';
import '../components/services_card.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart'; // Ajoutez le chemin vers le BottomNavbar
import '../components/food_cards.dart'; // Ajoutez le chemin vers le BottomNavbar

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
  // Color appBarColor = colorScheme.surfaceContainerLowest;
  // Color bodyColor = colorScheme.surfaceBright;
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
  double scrollOffset=0;

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
    // bodyColor = customColor.getColor("surfaceContainerLowest");
    bodyColor = customColor.getColor("surfaceBright");
  }
  void _onScroll() {
    if (_scrollController.hasClients) {
      setState(() {
        appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
          : customColor.getColor("surfaceContainerLowest");

        scrollOffset = _scrollController.offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    double space = 12;
    double marginTop = scrollOffset <= 10 ? 180 : 160;
    if (scrollOffset <= 10) {
      space = 0;
    }
    if(MediaQuery.of(context).size.width>500){
      marginTop = scrollOffset <= 10 ? 165 : 145;
    }
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bodyColor,
        body: Stack(
          children: [
            // Scrollable content
            if (scrollOffset <= 10) ServicesCard(),
            if (scrollOffset > 10) ServicesCard(state: 1),
            SizedBox(height: space),
            Container(
                margin: EdgeInsets.only(top: marginTop),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HorizontalLine(
                        color: colorScheme.outlineVariant,
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
                            color: colorScheme.onSurface,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      FoodCards(),
                      SizedBox(height: 96),
                    ],
                  ),
                )),

            // BottomNavbar at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavbar(), // Votre BottomNavbar
            ),
          ],
        ));
  }
}
