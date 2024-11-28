import 'package:flutter/material.dart';
import '../theme.dart';
import './phone_number_formatter.dart';
import 'package:flutter/services.dart';

// import 'package:material_symbols_icons/material_symbols_icons.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData? suffixIcon;
  final TextEditingController controller;
  String? errorText;
  final bool isNumero;
  final bool isPassword;
  final bool isEmail;
  final bool isFacultatif;
  final bool isLabel;
  final bool isNumber;

  CustomInput({
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    required this.controller,
    this.errorText = '',
    this.isNumero = false,
    this.isPassword = false,
    this.isEmail = false,
    this.isFacultatif = false,
    this.isLabel = true,
    this.isNumber = false,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late FocusNode _focusNode;
  bool _hasError = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        widget.errorText = _validateInput(widget.controller.text);
      });
    }
  }

  // Fonction de validation
  String? _validateInput(String value) {
    if (value.isEmpty && !widget.isFacultatif) {
      _hasError = true;
      return 'Ce champ ne peut pas être vide';
    } else if (widget.isNumero) {
      final regex = RegExp(r'^\d{3} \d{2} \d{3} \d{2}$');
      if (!regex.hasMatch(value)) {
        _hasError = true;
        return 'Le numéro doit contenir 10 chiffres';
      }
    } else if (widget.isNumber) {
      final regex = RegExp(r'^[+-]?\d+([.]\d+)?$');
      if (!regex.hasMatch(value)) {
        _hasError = true;
        return 'Veuillez entrer un nombre valide';
      }
    }
    _hasError = false;
    widget.errorText = '';
    return null;
  }

  String _formatNumber(String value) {
    // Si la valeur est vide, retourne une chaîne vide
    if (value.isEmpty) return value;

    // On essaie de transformer la valeur en nombre pour éviter les erreurs
    try {
      double number = double.parse(value.replaceAll(' ', ''));
      return number.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]} ");
    } catch (e) {
      return value; // Si c'est un texte non valide, on ne fait rien
    }
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor;
    double borderWidth = 1.0;

    if (_hasError) {
      mainColor = MaterialTheme.lightScheme().error;
    } else if (_focusNode.hasFocus) {
      mainColor = MaterialTheme.lightScheme().primary;
      borderWidth = 3.0;
    } else if (widget.controller.text.isNotEmpty) {
      mainColor = MaterialTheme.lightScheme().onSurface;
    } else {
      mainColor = MaterialTheme.lightScheme().outline;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.isNumber ? 96.0 : 56.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor,
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextFormField(
                obscureText: _obscurePassword && widget.isPassword,
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: mainColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                  errorText: null, // Gère l'erreur séparément
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MaterialTheme.lightScheme().surfaceContainerLowest,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: mainColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
                keyboardType: widget.isNumero
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: widget.isNumero ? [PhoneNumberFormatter()] : [],
                onChanged: (value) {
                  setState(() {
                    if (widget.isNumber) {
                      widget.controller.text = _formatNumber(value);
                      widget.controller.selection = TextSelection.collapsed(offset: widget.controller.text.length);
                    }
                    widget.errorText = _validateInput(value); // Valide à chaque changement
                  });
                },
                style: TextStyle(fontSize: widget.isNumber ? 44.0 : 16.0, color: mainColor),
                textAlign: widget.isNumber ? TextAlign.center : TextAlign.start, // Centrer le texte si c'est un nombre
                cursorColor: mainColor,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: _focusNode.hasFocus || widget.controller.text.isNotEmpty ? -14.0 : 16.0,
              left: 16.0,
              child: AnimatedOpacity(
                opacity: _focusNode.hasFocus || widget.controller.text.isNotEmpty ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: widget.isLabel
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                        color: Colors.white,
                        child: Text(
                          widget.labelText,
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
        Container(
          height: 16.0,
          padding: EdgeInsets.only(left: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.errorText ?? '',
            style: TextStyle(
              color: MaterialTheme.lightScheme().error,
              fontSize: 12.0,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}

