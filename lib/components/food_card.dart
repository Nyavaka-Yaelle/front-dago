import 'package:flutter/material.dart';
import '../theme.dart';

class FoodCard extends StatelessWidget {
  final String nomPlat;
  final String nomResto;
  final String? imagePlat;
  final String? imageResto;
  final double? star;
  final double prix;
  final VoidCallback?
      onPressed; // `VoidCallback?` pour accepter `null` si le bouton est désactivé

  // Constructeur
  const FoodCard({
    required this.nomPlat,
    required this.nomResto,
    this.imagePlat = '',
    this.imageResto = '',
    this.star = 0,
    required this.prix,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(image: image)
        ],
      ),
    );
  }
}
