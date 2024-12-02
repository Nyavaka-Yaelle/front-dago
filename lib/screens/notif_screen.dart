import 'package:flutter/material.dart';
import '../components/horizontal_line.dart';
import '../components/services_card.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';  // Ajoutez le chemin vers le BottomNavbar
import '../components/min_tab_items.dart';  // Ajoutez le chemin vers le BottomNavbar
import '../components/delivery_item.dart';  // Ajoutez le chemin vers le BottomNavbar

class NotifScreen extends StatefulWidget {
  final int idService;

  const NotifScreen({
    Key? key,
    this.idService = 0, // Valeur par défaut
  }) : super(key: key);

  @override
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  int _selectedIndex = 0; 
final List<DeliveryItem> notifications = [
    DeliveryItem(restoName: "Pakopako", items: "2 Menus"),
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
    setState(() {
      appBarColor = _scrollController.offset > 50
          ? MaterialTheme.lightScheme().surfaceContainerLowest
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }
void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: MaterialTheme.lightScheme().onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 12.0),
                Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    height: 1.33,
                    decoration: TextDecoration.none,
                  ),
                )),
              SizedBox(height: 24.0),
              MinTabItems(onTabChanged: _handleTabChange),
                HorizontalLine(
                  color: MaterialTheme.lightScheme().outlineVariant,
                  thickness: 1.0,
                ),
                if(notifications.length == 0) Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/8),
                    Center(
                      child: Image.asset(
                          'assets/images/notif0.png',
                          height: 220,
                        ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Vous n\'avez aucune notification',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: MaterialTheme.lightScheme().tertiary,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    )
                  ],
                )
                else 
                Column(children: [
                  SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 118), // Hauteur minimale de 136
                    child: Column(
                      children: notifications.asMap().entries.map((entry) {
                        final index = entry.key;
                        final transaction = entry.value;

                        return Column(
                          children: [
                            DeliveryItem(
                              restoName: transaction.restoName,
                              items: transaction.items,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ])
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
