import 'package:flutter/material.dart';
import '../theme.dart';

class MintabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function onTap;

  MintabItem(
      {required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:8),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500: FontWeight.w500,
                color: isSelected ? MaterialTheme.lightScheme().primary : MaterialTheme.lightScheme().onSurfaceVariant,
              ),
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 12),
                height: 2.4, // Height of the border
                color: MaterialTheme.lightScheme().primary, // Border color
                width: label.length.toDouble() *
                    6, // Dynamic width based on text length
              ),
          ],
        ),
      ),
    );
  }
}
