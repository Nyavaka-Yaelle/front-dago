import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../theme_notifier.dart';

class CustomToggleSwitch extends StatefulWidget {
  @override
  _CustomToggleSwitchState createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  late bool isToggled;
  late double _size;
  late Color _color; // = MaterialTheme.lightScheme().onSurface.withOpacity(0.48);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialiser isToggled en fonction du thème actuel
    // _color = Color(4290693573); // Initialisation temporaire
    isToggled = Theme.of(context).brightness == Brightness.dark;
    _size = isToggled ? 20 : 16; // Taille dynamique
    _color = isToggled
        ? ColorManager(context).getColor("surfaceContainerLowest")
        : Theme.of(context).colorScheme.onSurface.withOpacity(0.48);
    // _color = Theme.of(context).colorScheme.onSurface.withOpacity(0.48);
  }

  void _animateCircle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColor = ColorManager(context);
    // final customColorScheme = Theme.of(context).colorScheme;
    _size = isToggled ? 20 : 16; // Taille dynamique

    setState(() {
      _size = isToggled ? 28 : 32; // Taille dynamique
      _color = isToggled
          ? colorScheme.primaryContainer
          : colorScheme.onSurfaceVariant.withOpacity(0.8);
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _size = isToggled ? 21 : 16; // Taille dynamique
        _color = isToggled
            ? customColor.getColor("surfaceContainerLowest")
            : colorScheme.onSurface; //.withOpacity(0.64);
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
        _animateCircle(context);
        Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
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
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.48),
            // ? MaterialTheme.lightScheme().primary
            // : MaterialTheme.lightScheme().onSurface.withOpacity(0.48),
          ),
          color: isToggled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.48),
          // ? MaterialTheme.lightScheme().primary
          // : MaterialTheme.lightScheme().surfaceVariant.withOpacity(0.48),
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
