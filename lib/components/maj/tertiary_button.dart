import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onClick;

  const TertiaryButton({
    required this.label,
    required this.icon,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onClick,
        icon: Icon(icon, size: 18, color: colorScheme.onTertiaryContainer),
        label: Text(
          label,
          style: TextStyle(color: colorScheme.onTertiaryContainer),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.tertiaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          shadowColor: Colors.black.withOpacity(0.2),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
            (states) => states.contains(MaterialState.hovered) || states.contains(MaterialState.pressed) ? 2: 0,
          ),
        ),
      ),
    );
  }
}
