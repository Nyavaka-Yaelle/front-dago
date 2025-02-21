import 'package:flutter/material.dart';
import 'package:project1/theme.dart';

class TargetInformation extends StatelessWidget {
  final String depart;
  final String arrive;

  TargetInformation({
    this.depart = "Votre position",
    this.arrive = "Accès Banque Andavamamba",
    Key? key,
  }) : super(key: key);

  double _calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    final TextStyle textStyle = TextStyle(fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w400);
    final double departWidth = _calculateTextWidth(depart, textStyle);
    final double arriveWidth = _calculateTextWidth(arrive, textStyle);
    final double maxWidth = departWidth > arriveWidth ? departWidth : arriveWidth;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.my_location, size: 20.0, color: colorScheme.primary),
                    SizedBox(height: 8),
                    Icon(Icons.location_on_outlined, size: 20.0, color: colorScheme.error),
                  ],
                ),
                SizedBox(width: 14.0),
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6), // Ajuster la largeur maximale
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          depart,
                          style: textStyle.copyWith(color: colorScheme.primary),
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth.isFinite && constraints.maxWidth > 0) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                (constraints.maxWidth / 6).floor(),
                                (index) => SizedBox(width: 3, child: Divider(color: colorScheme.outline)),
                              ),
                            );
                          } else {
                            return Container(); // Retourne un conteneur vide si maxWidth n'est pas valide
                          }
                        },
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          arrive,
                          style: textStyle.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: Icon(Icons.edit_location_alt_outlined, size: 20.0, color: colorScheme.onSecondaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}