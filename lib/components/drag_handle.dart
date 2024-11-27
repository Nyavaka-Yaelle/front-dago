import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[400], // Couleur du handle
        borderRadius: BorderRadius.circular(100), // Bord arrondi
        border: Border.all(
          color: Colors.grey[600]!, // Couleur du contour
          width: 1,
        ),
      ),
    );
  }
}
