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
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

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
                color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
              ),
            ),
            if (isSelected)
              Container(
                margin: EdgeInsets.only(top: 12),
                height: 2.4, // Height of the border
                color: colorScheme.primary, // Border color
                width: label.length.toDouble() *
                    6, // Dynamic width based on text length
              ),
          ],
        ),
      ),
    );
  }
}
