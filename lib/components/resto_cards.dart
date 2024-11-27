import 'package:flutter/material.dart';
import './resto_card.dart';

class RestoCards extends StatefulWidget {
  @override
  _RestoCardsState createState() => _RestoCardsState();
}

class _RestoCardsState extends State<RestoCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(12),
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
          spacing: 6.0, // Espace horizontal entre les éléments
          runSpacing: 16.0, // Espace vertical entre les lignes d'éléments
          children: [
            RestoCard(nomResto: "Extra Pizza", ouvert: true, description: "Créateur de la pizza feuilletée et Leader du French tacos à Madagascar",star: 4.6),
            RestoCard(nomResto: "Extra Pizza", ouvert: true, description: "Créateur de la pizza feuilletée et Leader du French tacos à Madagascar",star: 4.6),
            RestoCard(nomResto: "Extra Pizza", ouvert: true, description: "Créateur de la pizza feuilletée et Leader du French tacos à Madagascar",star: 4.6),
          ],
        ),
      ));
  }
}
