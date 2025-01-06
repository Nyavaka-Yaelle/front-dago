import 'package:flutter/material.dart';
import '../components/profile_item.dart';
import '../theme.dart';
import '../components/bottom_navbar.dart';  // Ajoutez le chemin vers le BottomNavbar
import '../components/profile_picture_widget.dart';  // Ajoutez le chemin vers le BottomNavbar

class ProfileScreen extends StatefulWidget {
  // final int idService;
  final String username;
  final String email;

  const ProfileScreen({
    Key? key,
    // this.idService = 0,
    required this.username,
    required this.email, 

  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;  // int _selectedIndex = 0; 

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
    setState(() {
      appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
          : customColor.getColor("surfaceContainerLowest");
    });
  }
  
  // void _handleTabChange(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: colorScheme.onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
        title: Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'Roboto', // Exemple de font family, vous pouvez mettre celui que vous préférez
            fontSize: 21.0, // Exemple de taille de police (fontSize)
            color: colorScheme.onSurface
          ), // Couleur du texte (foregroundColor)
        ),
        foregroundColor: colorScheme.onSurface,        
      ),
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 4.0),
                ProfilePictureWidget(),
                SizedBox(height: 4.0),  
                Center(
                  child: Column(
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 2.0), 
                      Text(
                        widget.email,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.secondary,
                          letterSpacing: 0.1
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      SizedBox(height: 12),
                      ProfileItem(
                        icon: Icons.person,
                        title: "Compte",
                        detail: "Vos informations personnelles",
                      ),
                      SizedBox(height: 12),
                      ProfileItem(
                        icon: Icons.history,
                        title: "Historique",
                        detail: "Vos divers historiques",
                      ),
                      SizedBox(height: 12),
                      ProfileItem(
                        icon: Icons.wallet,
                        title: "Wallet",
                        detail: "Gérer vos paiements",
                      ),
                      SizedBox(height: 12),
                      ProfileItem(
                        icon: Icons.settings,
                        title: "Paramètres",
                        detail: "Paramètres de l'application",
                      ),
                    ],
                  ),
                ),
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
