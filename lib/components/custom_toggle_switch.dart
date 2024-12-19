import 'package:flutter/material.dart';
import '../theme.dart';

class CustomToggleSwitch extends StatefulWidget {
  @override
  _CustomToggleSwitchState createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  bool isToggled = false;
  double _size = 16;
  Color _color = MaterialTheme.lightScheme().onSurface.withOpacity(0.48);

  void _animateCircle() {
    _size = isToggled ? 20 : 16; // Taille dynamique
    _color = isToggled
        ? MaterialTheme.lightScheme().surfaceContainerLowest
        : MaterialTheme.lightScheme().onSurface.withOpacity(0.48);

    setState(() {
      _size = isToggled ? 28 : 32; // Taille dynamique
      _color = isToggled
          ? MaterialTheme.lightScheme().primaryContainer
          : MaterialTheme.lightScheme().onSurfaceVariant.withOpacity(0.8);
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _size = isToggled ? 21 : 16; // Taille dynamique
        _color = isToggled
            ? MaterialTheme.lightScheme().surfaceContainerLowest
            : MaterialTheme.lightScheme().onSurface.withOpacity(0.48);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // double size = isToggled ? 24 : 16; // Taille dynamique
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled;
        });
        _animateCircle();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
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
        child: Stack(children: [
          AnimatedAlign(
            duration: Duration(
                milliseconds: 200), // Durée de l'animation pour le slide
            alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 3, 3, 3),
              child: AnimatedContainer(
                duration: Duration(
                    milliseconds: 100), // Durée de l'animation pour la taille
                width: _size, // Taille dynamique du bouton interne
                height: _size, // Taille dynamique du bouton interne
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _color,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
