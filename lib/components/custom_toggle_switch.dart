import 'package:flutter/material.dart';
import '../theme.dart';

class CustomToggleSwitch extends StatefulWidget {
  @override
  _CustomToggleSwitchState createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    double size = isToggled ? 24 : 16; // Taille dynamique
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Durée de l'animation pour le slider
        width: 52,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isToggled
                ? MaterialTheme.lightScheme().primary
                : MaterialTheme.lightScheme().onSurface.withOpacity(0.48),
          ),
          color: isToggled
              ? MaterialTheme.lightScheme().primary
              : MaterialTheme.lightScheme().surfaceVariant.withOpacity(0.48),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 300), // Durée de l'animation pour le slide
          alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 3, 3, 3),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300), // Durée de l'animation pour la taille
              width: size, // Taille dynamique du bouton interne
              height: size, // Taille dynamique du bouton interne
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isToggled
                    ? MaterialTheme.lightScheme().onPrimary
                    : MaterialTheme.lightScheme()
                        .onSurface
                        .withOpacity(0.48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
