import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // Importer le package
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart'; // Pour obtenir un répertoire temporaire

import '../theme.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  String? _photoUrl;
  File? _image;

  // Demander la permission à l'exécution
  Future<void> requestPermissions() async {
    // Demander la permission de la caméra
    PermissionStatus cameraStatus = await Permission.camera.request();
    // Demander la permission de lire les fichiers
    PermissionStatus storageStatus = await Permission.photos.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      // Si les permissions sont accordées, choisir l'image
      _pickImage();
    } else {
      print('Permission refusée');
    }
  }

  // Fonction pour choisir l'image (sans recadrage)
  /*Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _photoUrl = image.path; // Met à jour directement le chemin de l'image choisie
      });
    }
  }*/
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
            toolbarColor: MaterialTheme.lightScheme().surfaceContainerLow.withOpacity(0.24),
            toolbarWidgetColor: MaterialTheme.lightScheme().onSurface,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            activeControlsWidgetColor:Color.fromARGB(255, 109, 227, 184),
            // cropFrameColor: Colors.green, // Couleur de la bordure du cadre de recadrage
            // cropGridColor: Colors.green.withOpacity(0.5), // Couleur de la grille de recadrage
          ),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
            // activeControlsWidgetColor:MaterialTheme.lightScheme().primary,
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
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: _photoUrl == null ? 10 : 0,
                color: _photoUrl == null
                    ? MaterialTheme.lightScheme().onSecondaryContainer
                    : Colors.transparent,
              ),
            ),
            child: CircleAvatar(
              radius: _photoUrl == null ? 56 : 64, // Rayon de l'avatar
              backgroundColor: Colors.transparent, // Fond transparent
              child: _photoUrl == null
                  ? Stack(children: [
                      Positioned(
                        top: 0, // Positionnement de l'icône
                        left: -12,
                        child: Icon(
                          Icons.person_rounded,
                          color:
                              MaterialTheme.lightScheme().onSecondaryContainer,
                          size: 136,
                        ),
                      )
                    ])
                  : ClipOval(
                      // Utilisation de ClipRect pour découper en carré
                      child: Image.file(
                        File(_photoUrl!),
                        width: 136, // Largeur du carré
                        height: 136, // Hauteur du carré
                        fit: BoxFit
                            .cover, // Ajuste l'image pour remplir le carré
                      ),
                    ),
            ),
          ),
          Positioned(
            bottom: _photoUrl == null ? -0 : 0,
            // right: _photoUrl == null ? -0 : null,
            // left: _photoUrl == null ? null : 50,
            left: 50,
            child: GestureDetector(
              onTap: _pickImage, // Ouvre la galerie pour choisir une image
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(48, 0, 0, 0),
                      blurRadius: 24, // Flou
                      offset: Offset(0, 0), // Décalage
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: _photoUrl == null
                      // ? MaterialTheme.lightScheme().secondaryContainer
                      ? MaterialTheme.lightScheme()
                          .secondaryContainer
                          .withOpacity(0)
                      : Colors.transparent,
                  child: Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: _photoUrl == null
                        // ? MaterialTheme.lightScheme().onSecondaryContainer
                        ? MaterialTheme.lightScheme().surfaceContainerLowest
                        : MaterialTheme.lightScheme().surfaceContainerLowest,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
