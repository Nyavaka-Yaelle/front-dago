import 'package:flutter/material.dart';
import 'package:project1/components/custom_icon_button.dart';
import 'package:project1/components/text_icon_button.dart';
import '../components/profile_detail_item.dart';
import '../components/profile_details_item.dart';
import '../components/profile_picture_widget.dart';
import '../theme.dart';

class AccountProfile extends StatefulWidget {
  // final int idService;
  final String nom;
  final String prenom;
  final String tel;
  final String email;
  final String motDePasse;

  const AccountProfile({
    Key? key,
    // this.idService = 0,
    this.nom = 'van Astrea',
    this.prenom = 'Bema',
    this.tel = '+261 32 16 322 32',
    this.email = 'bema.astrea@theworld.com',
    this.motDePasse = '12345678',
  }) : super(key: key);

  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
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

String formatIt(String input) {
  return List.generate(input.length, (_) => '• ').join();
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
        icon: Icon(
          Icons.arrow_back,
          size: 24.0,
          color: colorScheme.onSurfaceVariant,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: appBarColor,
      elevation: 0,
      foregroundColor: colorScheme.onSurface,
      title: Text(
        'Compte',
        style: TextStyle(
          fontFamily: 'Roboto', // Exemple de font family, vous pouvez mettre celui que vous préférez
          fontSize: 21.0, // Exemple de taille de police (fontSize)
          color: colorScheme.onSurface
        ),
      )
    ),
   body: SingleChildScrollView(
      controller: _scrollController, // Ajout du ScrollController
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 4.0),
            ProfilePictureWidget(),
            SizedBox(height: 24.0),
            ProfileDetailsItem(
              icon: Icons.person_outline_rounded,
              title1: "Nom", title2:"Prenom",
              detail1: widget.nom, detail2: widget.prenom,
            ),
            SizedBox(height: 8.0),
            ProfileDetailItem(
              icon: Icons.call_outlined,
              title: "Telephone",
              detail: widget.tel,
            ),
            SizedBox(height: 8.0),
            ProfileDetailItem(
              icon: Icons.email_outlined,
              title: "E-mail",
              detail: widget.email,
            ),
            SizedBox(height: 8.0),
            ProfileDetailItem(
              icon: Icons.lock_outline_rounded,
              title: "Mot de passe",
              detail: formatIt(widget.motDePasse),
            ),
            SizedBox(height: 4.0),
            Divider(),
            SizedBox(height: 4.0),
            Text(
              "Adresses", // Exemple : "2 menus"
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onTertiaryContainer, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 4.0),
            Text(
              "Ajouter des adresses ou des lieux pour faciliter vos déplacements et vos livraisons.", // Exemple : "2 menus"
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.tertiary, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(outline: true, label: "Ajouter des adresses", onPressed: (){}, color: colorScheme.primary, icon: Icons.bookmark_rounded, beforeIcon: true)
                ]
              )
            ),
            SizedBox(height: 8.0),
            Divider(),
            SizedBox(height: 4.0),     
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextIconButton(label: "Déconnexion", color: colorScheme.error, icon: Icons.logout_outlined)
              ]
            ),
            SizedBox(height: 24.0),     
          ],
        ),
      ),
    ),
  );  }
}