import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BillInformation extends StatelessWidget {
  final int montant; 
  final int state; 

  const BillInformation({
    Key? key,
    required this.montant,
    this.state = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Row(children: [
      Column(
        children: [
          Text("Montant : $montant"),
          Text("Etat : $state"),
        ],
      )
     ]),
    );
  }
}
