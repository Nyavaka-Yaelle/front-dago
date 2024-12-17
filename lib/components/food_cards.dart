import 'package:flutter/material.dart';
import './custom_item.dart';
import './food_card_simple.dart';
import './custom_icon_button.dart';
import './food_card.dart';
import './resto_card.dart';
import '../theme.dart'; // Importez le fichier TabItem si nécessaire

class FoodCards extends StatefulWidget {
    final bool simple;
const FoodCards({
    Key? key,
    this.simple = false, // Défaut à `true` si non spécifié
  }) : super(key: key);
  @override
  _FoodCardsState createState() => _FoodCardsState();
}

class _FoodCardsState extends State<FoodCards> {
  @override
  Widget build(BuildContext context) {
    return 
    Center(child: Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width, // Vous pouvez garder la largeur dynamique ici.
      // child: ConstrainedBox(
        // constraints: BoxConstraints(maxWidth: 800), // Limiter la largeur maximale
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Wrap(
              spacing: 6.0, // Espace horizontal entre les éléments
              runSpacing: 16.0, // Espace vertical entre les lignes d'éléments
              children: widget.simple?[
                FoodCardSimple(
                  nomPlat: "Atin'ny coucou",
                  prix: 15000.0,
                ),
                FoodCardSimple(
                  nomPlat: "Poulet Roti",
                  prix: 20000.0,
                ),
                FoodCardSimple(
                  nomPlat: "Poulet Roti",
                  prix: 20000.0,
                ),
                FoodCardSimple(
                  nomPlat: "Poulet Roti",
                  prix: 20000.0,
                ),
                SizedBox(height: 86),
              ]
              : [
                FoodCard(
                  nomPlat: "Atin'ny coucou",
                  nomResto: "Pakopako",
                  prix: 15000.0,
                  star: 4.6,
                ),
                FoodCard(
                  nomPlat: "Poulet Roti",
                  nomResto: "Chez Mama",
                  prix: 20000.0,
                  star: 4.8,
                ),
                FoodCard(
                  nomPlat: "Burger Deluxe",
                  nomResto: "FastFood Pro",
                  prix: 12000.0,
                  star: 4.2,
                ),
                FoodCard(
                  nomPlat: "Pizza Royale",
                  nomResto: "Pizzaland",
                  prix: 18000.0,
                  star: 4.7,
                ),
                FoodCard(
                  nomPlat: "Pizza Royale",
                  nomResto: "Pizzaland",
                  prix: 18000.0,
                  star: 4.7,
                ),
               
              ],
            )
          ),
        ),
      // ),
    ));
  }
}
