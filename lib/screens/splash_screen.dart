import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Configure l'animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward(); // Lancer l'animation

    // Transition vers LoginScreen après 3 secondes
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Scaffold(
      backgroundColor: customColor.getColor("surfaceContainerLowest"), 
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/ridee_logo.png', // Remplace par le chemin de ton logo
                width: 100, // Taille initiale
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/logo.png', // Remplace par le chemin de ton logo
                width: 120, // Taille initiale
                height: 56,
              ),
            ),
          ),
          SizedBox(height: 96),
      ])
    );
  }
}