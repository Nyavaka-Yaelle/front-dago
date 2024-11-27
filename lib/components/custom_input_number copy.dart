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
    setState(() {
      _currentValue++;
      widget.onChanged(_currentValue); // Notifier la valeur à la fonction parent
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > 0) {
        _currentValue--;
        widget.onChanged(_currentValue); // Notifier la valeur à la fonction parent
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color:MaterialTheme.lightScheme().outlineVariant),
        color: MaterialTheme.lightScheme().surfaceContainerLow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: Icon(Icons.remove, size: 16),
          ),
          Text(
            _currentValue.toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: MaterialTheme.lightScheme().onSurface
              ),
          ),
          IconButton(
            onPressed: _increment,
            icon: Icon(Icons.add, size: 16),
          ),
        ],
      ),
    );
  }
}
