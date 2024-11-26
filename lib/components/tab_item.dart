import 'package:flutter/material.dart';
import '../theme.dart';
class TabItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          // color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          // borderRadius: BorderRadius.circular(8.0),
          border: isSelected? Border(
            bottom: BorderSide(
              width: 2.0,
              color: MaterialTheme.lightScheme().primary, // Définit la couleur de la bordure
            ),
          ): Border(
            bottom: BorderSide(
              width: 0.5,
              color: MaterialTheme.lightScheme().outlineVariant, // Définit la couleur de la bordure
            )),
        ),
        
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? MaterialTheme.lightScheme().onSurface : MaterialTheme.lightScheme().onSurfaceVariant,
            ),
            SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? MaterialTheme.lightScheme().onSurface : MaterialTheme.lightScheme().onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
