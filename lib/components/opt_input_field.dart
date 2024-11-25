import 'package:flutter/material.dart';
import '../theme.dart';

class OtpInputField extends StatelessWidget {
  final int length;

  const OtpInputField({Key? key, this.length = 6}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2), // 12px total gap
          width: MediaQuery.of(context).size.width * 0.14, // width 48px
          height: 48, // height 48px
          decoration: BoxDecoration(
            color: MaterialTheme.lightScheme().surface, // Background color
            borderRadius: BorderRadius.circular(12), // radius 12px
            border: Border.all(width: 0.5, color: MaterialTheme.lightScheme().outlineVariant), // Optional border
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child:
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, color: MaterialTheme.lightScheme().onSurface, fontWeight: FontWeight.w300),
              cursorColor: const Color.fromARGB(0, 255, 255, 255),
              keyboardType: TextInputType.number,
              maxLength: 1, // One character per box
              decoration: const InputDecoration(
                counterText: "", // Hides the maxLength counter
                border: InputBorder.none, // Removes default underline
              ),
            ),
          ),
        );
      }),
    );
  }
}
