import 'package:flutter/material.dart';
import '../theme.dart';

class TextIconButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool isDisabled;
  final IconData? icon;
  final bool beforeIcon;

  // Constructeur
  const TextIconButton({
    required this.label,
    required this.color,
    this.isDisabled = false,
    this.icon,
    this.beforeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          child: Row(children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge
              ?.copyWith(color: color, fontWeight: FontWeight.w500),
        ),
      ])),
    );
  }
}
