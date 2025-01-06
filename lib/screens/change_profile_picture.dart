import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../theme.dart';
import '../components/custom_icon_button.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart'; // Pour obtenir un répertoire temporaire


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
  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
  late ColorScheme colorScheme;
  // int _selectedIndex = 0;
  String? _photoUrl;
    File? _image;


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
    colorScheme = Theme.of(context).colorScheme;
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

  void _deletePdp() {
    setState(() {
      _photoUrl = null;
    });
  }
    Future<void> _pickImage() async {
    // Vérifiez les permissions
    // if (await Permission.photos.request().isGranted) {
    // final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        File? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            // CropAspectRatioPreset.ratio3x2,
            // CropAspectRatioPreset.original,
            // CropAspectRatioPreset.ratio4x3,
            // CropAspectRatioPreset.ratio16x9,
          ],
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Rogner l\'image',
            toolbarColor: customColor.getColor("surfaceContainerLow").withOpacity(0.24),
            toolbarWidgetColor: colorScheme.onSurface,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            activeControlsWidgetColor:Color.fromARGB(255, 109, 227, 184),
            // cropFrameColor: Colors.green, // Couleur de la bordure du cadre de recadrage
            // cropGridColor: Colors.green.withOpacity(0.5), // Couleur de la grille de recadrage
          ),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
            // activeControlsWidgetColor:colorScheme.primary,
          ),
        );

        if (croppedFile != null) {
          File? compressedFile = await compressImage(croppedFile);
          if(compressedFile!=null) setState(() {
            // _image = File(croppedFile.path);
            // _photoUrl = croppedFile.path;
            _image = File(compressedFile.path);
            _photoUrl = compressedFile.path;
          });
        }
      }
    } catch (error) {
      print(error);
      if (pickedFile != null) {
        setState(() {
          _photoUrl = pickedFile.path; // Met à jour directement le chemin de l'image choisie
        });
      }
    }
    // } else {
    //   // Demander les permissions
    //   await Permission.photos.request();
    // }
  }
  // Fonction pour compresser l'image
    Future<File?> compressImage(File imageFile) async {
      final dir = await getTemporaryDirectory();
      final targetPath = dir.absolute.path + "/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg";

      // Compression de l'image
      var result = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path,
        targetPath,
        quality: 72, // La qualité de l'image compressée
        minWidth: 600, // Largeur minimale
        minHeight: 600, // Hauteur minimale
      );

      return result;
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
          color: colorScheme.onSurfaceVariant,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: appBarColor,
      elevation: 0,
      foregroundColor: colorScheme.onSurface,
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
                  color: colorScheme.onPrimaryContainer,
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
                  color: colorScheme.tertiary,
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
              color: colorScheme.onSecondaryContainer,
              width: _photoUrl == null ? 10 : 0,
            ),
          ),
          child: CircleAvatar(
            radius: _photoUrl == null ? 56 : 64,
            backgroundColor: Colors.transparent,
            child: _photoUrl == null
                ? Icon(
                    Icons.person_rounded,
                    color: colorScheme.onSecondaryContainer,
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
              color: colorScheme.onSurface,
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
                color: colorScheme.primaryContainer,
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
                      color: colorScheme.primaryContainer,
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
                      color: colorScheme.primaryContainer,
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