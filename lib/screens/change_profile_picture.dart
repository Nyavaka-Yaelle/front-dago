import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../theme.dart';
import '../components/delivery_item.dart';
import '../components/custom_icon_button.dart';

class ChangeProfilePicture extends StatefulWidget {
  // final int idService;
  final String username;
  final String email;

  const ChangeProfilePicture({
    Key? key,
    // this.idService = 0,
    required this.username,
    this.email='',
  }) : super(key: key);

  @override
  _ChangeProfilePictureState createState() => _ChangeProfilePictureState();
}

class _ChangeProfilePictureState extends State<ChangeProfilePicture> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLowest;
  // int _selectedIndex = 0;
  String? _photoUrl;

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

  void _deletePdp() {
    setState(() {
      _photoUrl = null;
    });
  }
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _photoUrl =
            image.path; // Met à jour directement le chemin de l'image choisie
      });
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: bodyColor,
    appBar: AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 24.0,
          color: MaterialTheme.lightScheme().onSurfaceVariant,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: appBarColor,
      elevation: 0,
      foregroundColor: MaterialTheme.lightScheme().onSurface,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 12, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Photo de profil',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                _photoUrl==null?'Ajouter une photo de profil pour que vos livreurs et chauffeurs vous reconnaissent facilement et vivent une expérience plus personnelle.': 'Votre photo de profile aide vos livreurs et vos chauffeurs à vous identifier facilement et à vous offrir une service encore plus adapté.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  decoration: TextDecoration.none,
                  color: MaterialTheme.lightScheme().onPrimaryContainer,
                ),
              ),
              SizedBox(height: 4.0),
              if(_photoUrl==null)Text(
                'L’image uploader ne doit pas dépasser les 16Mo.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  decoration: TextDecoration.none,
                  color: MaterialTheme.lightScheme().tertiary,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: _photoUrl == null ? 10 : 0,
            ),
          ),
          child: CircleAvatar(
            radius: _photoUrl == null ? 56 : 64,
            backgroundColor: Colors.transparent,
            child: _photoUrl == null
                ? Icon(
                    Icons.person_rounded,
                    color: MaterialTheme.lightScheme().onSecondaryContainer,
                    size: 136,
                  )
                : ClipOval(
                    child: Image.file(
                      File(_photoUrl!),
                      width: 136,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 16.0),
        Center(
          child: Text(
            widget.username,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MaterialTheme.lightScheme().onSurface,
            ),
          ),
        ),
        Spacer(), // Pousse les widgets précédents vers le haut
        Padding(
          padding: const EdgeInsets.only(bottom: 56.0),
          child: 
          _photoUrl==null?
          Center(
            child: IntrinsicWidth(
              child: CustomIconButton(
                beforeIcon: true,
                icon: Icons.add,
                label: "Ajouter une photo",
                onPressed: _pickImage,
                color: MaterialTheme.lightScheme().primaryContainer,
              ),
            ),
          ):
          Center(
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centre les enfants horizontalement
              children: [
                Center(
                  child: IntrinsicWidth(
                    child: CustomIconButton(
                      beforeIcon: true,
                      icon: Icons.delete_outlined,
                      label: "Supprimer",
                      onPressed: _deletePdp,
                      color: MaterialTheme.lightScheme().primaryContainer,
                    ),
                  ),
                ),
                SizedBox(width: 12), // Espacement horizontal entre les boutons
                Center(
                  child: IntrinsicWidth(
                    child: CustomIconButton(
                      beforeIcon: true,
                      icon: Icons.edit_outlined,
                      label: "Modifier",
                      onPressed: _pickImage,
                      color: MaterialTheme.lightScheme().primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        ),
      ],
    ),
  );  }
}