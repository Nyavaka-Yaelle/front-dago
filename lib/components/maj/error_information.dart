import 'package:flutter/material.dart';
import 'package:project1/theme.dart';

class ErrorInformation extends StatelessWidget {
  final String state;  // L'état qui peut être 'error' ou 'info'
  late IconData icon;
  late String message;

ErrorInformation({
  required this.state,
  this.icon = Icons.error_outline,
  this.message = "",
  Key? key,
}) : super(key: key) {
  if (state == 'error' && message.isEmpty) {
    message = 'Une erreur est survenue';
  }
}
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

  

    // Définir l'icône et le message en fonction de l'état
   
    Color currentColor = state == 'error' ? colorScheme.error : colorScheme.tertiary;
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: currentColor, size: 18,),
          SizedBox(width: 8),
          Container(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                message,
                style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color:currentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}