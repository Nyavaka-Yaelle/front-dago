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
    // setState(() {
    //   _hasError = widget.errorText != null && widget.errorText!.isNotEmpty && widget.errorText!='';
    // });
    if (!_focusNode.hasFocus) {
      // Valider le champ lorsque le focus est perdu
      setState(() {
        widget.errorText = _validateInput(widget.controller.text);
      });
    }
  }

  // Fonction de validation
  String? _validateInput(String value) {
    // Regex pour vérifier que le texte contient uniquement des chiffres et ne dépasse pas 10 caractères
    if (value.isEmpty && !widget.isFacultatif) {
      _hasError = true;
      return 'Ce champ ne peut pas être vide';
    } else if (widget.isNumero) {
      final regex = RegExp(r'^\d{3} \d{2} \d{3} \d{2}$');
      if (!regex.hasMatch(value)) {
        _hasError = true;
        return 'Le numéro doit contenir 10 chiffres';
      }
    } 
    else if (widget.isPassword) {
      final regex = RegExp(r'^.{6,}$');
      if (!regex.hasMatch(value)) {
        _hasError = true;
        return 'Le mot de passe doit contenir au moins 6 caractères';
      }
    }
    else if (widget.isEmail) {
      final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Regex pour email
      if (!regex.hasMatch(value)) {
        _hasError = true;
        return 'Veuillez entrer une adresse email valide';
      }
    }
    else if (value.isEmpty && widget.isFacultatif) {
      _hasError = false;
      return null;
    }
    _hasError = false;
    widget.errorText = '';
    return null;
  }
  // TextInputFormatter getHideFormat() {
  //   if (_obscurePassword && widget.isPassword) {
  //     return '*' * widget.controller.text.length;
  //   }
  //   return widget.controller.text;
  // }
  @override
  Widget build(BuildContext context) {
    Color mainColor;
    double borderWidth = 1.0;
    if (_hasError) {
      // mainColor = DagoTheme.error; // Bordure rouge en cas d'erreur
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
          clipBehavior:
              Clip.none, // Permet au label de flotter au-dessus du champ
          children: [
            // Le Container contenant le TextField
            Container(
              height: 56.0,
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
                  errorText: null, // On gère l'erreur séparément
                  border: InputBorder.none,
                  filled: true,
                  fillColor: MaterialTheme.lightScheme().surfaceContainerLowest,
                  // suffixIcon: widget.suffixIcon != null
                  //     ? Icon(widget.suffixIcon, color: mainColor)
                  //     // Icon( 'visibility_off_rounded' as IconData?, color: mainColor )
                  //     : null,
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
                  contentPadding: const EdgeInsets.symmetric( vertical: 16.0, horizontal: 16.0),
                ),
                keyboardType: widget.isNumero
                    ? TextInputType.number
                    : TextInputType.text, // Clavier conditionnel
                inputFormatters: 
                  widget.isNumero ? [PhoneNumberFormatter()] :
                  // _obscurePassword ?[getHideFormat()] :
                  [], // Application du formateur
                // validator: (value) => _validateInput(value ?? ''),// Validation lors de la soumission du formulaire
                onChanged: (value) {
                  setState(() {
                    widget.errorText =
                        _validateInput(value); // Valide à chaque changement
                  });
                },
                style: TextStyle(fontSize: 16.0, color: mainColor),
                cursorColor: mainColor,
              ),
            ),
            // Label flottant en haut à gauche, s'affichant en focus ou texte
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: _focusNode.hasFocus || widget.controller.text.isNotEmpty
                  ? -14.0
                  : 16.0,
              left: 16.0,
              child: AnimatedOpacity(
                opacity:
                    _focusNode.hasFocus || widget.controller.text.isNotEmpty
                        ? 1.0
                        : 0.0,
                duration: Duration(milliseconds: 300),
                child: Container(
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
                ),
              ),
            ),
          ],
        ),
        // Texte d'erreur en dessous
        // SizedBox(height: 8.0), // Espacement entre le champ et le texte d'erreur
        Container(
          height: 16.0,
          padding: EdgeInsets.only(left: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.errorText ??
                '', // Affiche le texte d'erreur uniquement s'il existe
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
