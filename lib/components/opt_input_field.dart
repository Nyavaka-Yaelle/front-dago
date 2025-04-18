import 'package:flutter/material.dart';
import '../theme.dart';

class OtpInputField extends StatefulWidget {
  final int length;
  final bool error;
  final Function(String) onChanged; // Callback pour informer le parent

  const OtpInputField({
    Key? key,
    this.length = 6,
    this.error = false,
    required this.onChanged, // Ajout du callback
  }) : super(key: key);

  @override
  OtpInputFieldState createState() => OtpInputFieldState();
}

class OtpInputFieldState extends State<OtpInputField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());

    // Met automatiquement le focus sur le premier champ au chargement
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes[0]);
    });
  }

  @override
  void dispose() {
    // Dispose des contrôleurs et focus
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
  
  bool areAllFieldsFilled() {
    return controllers.every((controller) => controller.text.isNotEmpty);
  }

  void clearFields() {
    for (var controller in controllers) {
      controller.clear();
    }
    FocusScope.of(context).requestFocus(focusNodes[0]);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2), // 12px total gap
          width: MediaQuery.of(context).size.width * 0.14, // width 48px
          height: 52, // height 48px
          decoration: BoxDecoration(
            color: colorScheme.surface, // Background color
            borderRadius: BorderRadius.circular(12), // radius 12px
            border: Border.all(width: 0.5, color: colorScheme.outlineVariant), // Optional border
          ),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              color: widget.error ? colorScheme.error : colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: const Color.fromARGB(0, 255, 255, 255),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Appelle le callback uniquement quand un champ est modifié
              widget.onChanged(controllers.map((c) => c.text).join());

              if (value.isNotEmpty) {
                // Si un chiffre est saisi, passe au champ suivant
                if (index + 1 < widget.length) {
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                }
              } else {
                // Si le champ est vide, passe au champ précédent
                if (index - 1 >= 0) {
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              }
            },
            onSubmitted: (_) {
              // Passe au champ suivant ou reste sur le dernier
              if (index + 1 < widget.length) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
            },
            onEditingComplete: () {
              // Si le champ est vide et qu'on est pas au début, passe au champ précédent
              if (controllers[index].text.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}