import 'package:flutter/material.dart';
import '../theme.dart';

class CustomInputNumber extends StatefulWidget {
  final int initialValue;
  final int min;
  final int? max;
  final Function(int) onChanged;

  const CustomInputNumber({
    required this.initialValue,
    this.min = 0,
    this.max,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CustomInputNumberState createState() => _CustomInputNumberState();
}

class _CustomInputNumberState extends State<CustomInputNumber> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _increment() {
    if (widget.max == null || _currentValue < widget.max!) {
      setState(() {
        _currentValue++;
        widget.onChanged(_currentValue); // Notifier la valeur à la fonction parent
      });
    }
  }

  void _decrement() {
    if (_currentValue > widget.min) {
      setState(() {
        _currentValue--;
        widget.onChanged(_currentValue); // Notifier la valeur à la fonction parent
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Container(
      // width: 120,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: colorScheme.outlineVariant),
        color: customColor.getColor("surfaceContainerLowest"),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 18,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              // border: Border.all(color: colorScheme.primary),
              color: _currentValue > widget.min
                  ? colorScheme.primary
                  : colorScheme.primary.withOpacity(0.5),
            ),
            child: Center( // Aligner l'icône au centre
              child: GestureDetector(
                onTap: _currentValue > widget.min ? _decrement : null, // Action lorsque l'utilisateur appuie
                child: Icon(
                  Icons.remove,
                  size: 16,
                  color: customColor.getColor("surfaceContainerLowest"),
                ),
              ),
            ),
          ),

          // Valeur actuelle
          Container(
            width:32,
            child:Center(
              child: Text(
                _currentValue.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurface,
                  decoration: TextDecoration.none,
                )
              ),
            ),
          ),

          // Bouton "+" avec un borderRadius et une bordure verte
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // border: Border.all(color: colorScheme.primary),
              color: colorScheme.primary,
            ),
            child: Center( // Aligner l'icône au centre
              child: GestureDetector(
                onTap: _increment, // Action lorsque l'utilisateur appuie
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: customColor.getColor("surfaceContainerLowest"),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
