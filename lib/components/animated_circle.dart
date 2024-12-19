import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({super.key});

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle> {
  double _size = 24;
  double _offset = 0;

  void _animateCircle() {
    setState(() {
      _size = 28; // Agrandir à 28
      _offset = 50; // Déplacer à gauche
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _size = 20; // Réduire à 20
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateCircle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: _size,
        height: _size,
        margin: EdgeInsets.only(left: _offset),
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
