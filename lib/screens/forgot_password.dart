import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import './new_password.dart';
import '../theme.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController telController = TextEditingController();

  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
  
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    telController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customColor = ColorManager(context);
    appBarColor = customColor.getColor("surfaceContainerLowest");
    bodyColor = customColor.getColor("surfaceContainerLowest");
  }
  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
          : customColor.getColor("surfaceContainerLowest");    });
  }
  void _updateButtonState() {
    setState(() {
      isButtonEnabled = RegExp(r'^\d{3} \d{2} \d{3} \d{2}$').hasMatch(telController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor, 
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: colorScheme.onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Image.asset(
              //     'assets/images/login_image.png',
              //     height: 56.0,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              SizedBox(height: 12.0),
              Text(
                'Vous avez oublié votre\nMot de passe ?',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,8),
                child: Text(
                  'Aucune inquiétude cela peut arriver. \nVeuillez entrer le numéro de téléphone associé à votre compte.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(0.12),
                  1: FlexColumnWidth(0.88),
                },
                children: [
                  TableRow(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 56.0,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.call_outlined,
                            color: colorScheme.onSurface,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Téléphone",
                          labelText: "Téléphone",
                          controller: telController,
                          isNumero: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 160.0,
                  child: CustomButton(
                    label: "Suivant",
                    isDisabled: !isButtonEnabled,
                    onPressed:  isButtonEnabled
                      ? (){
                      print("Button pressed!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPassword()),
                      );
                    }: null,
                    color: colorScheme.primary,
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}