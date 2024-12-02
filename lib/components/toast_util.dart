import 'package:flutter/material.dart';
import '../theme.dart';

class ToastUtil {
  // Fonction pour afficher un toast
  // static void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT, // Durée d'affichage
  //     gravity: ToastGravity.BOTTOM, // Position du toast
  //     timeInSecForIosWeb: 1, // Durée sur iOS (optionnel)
  //     backgroundColor: Colors.red, // Couleur du fond
  //     textColor: Colors.white, // Couleur du texte
  //     fontSize: 16.0, // Taille du texte
  //   );
  // }
  static void showToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100.0, // Position verticale
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );

    // Affichage du toast
    overlay.insert(overlayEntry);

    // Retirer le toast après un délai
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
