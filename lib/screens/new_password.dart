import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import '../theme.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
  Color bodyColor = MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Modifier la couleur selon la position de défilement
    setState(() {
      // appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;
      appBarColor = _scrollController.offset > 50
          ? MaterialTheme.lightScheme().surfaceContainerLowest
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }
  void _updateButtonState() {
    setState(() {
      isButtonEnabled = RegExp(r'^.{6,}$').hasMatch(passwordController.text) && passwordController.text.compareTo(confirmPasswordController.text)==0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor, 
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: MaterialTheme.lightScheme().onSurfaceVariant,), // Flèche "Retour"
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
          // padding: const EdgeInsets.all(24.0),
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
                'Nouveau mot de passe',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: Text(
                  'Veuillez entrer votre nouveau mot de passe',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,8),
                child: Text(
                  'Nous vous conseillons de combiner des lettres, \ndes chiffres, des symboles.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    decoration: TextDecoration.none,
                    color: MaterialTheme.lightScheme().tertiary,
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
                            Icons.lock_outlined,
                            color: MaterialTheme.lightScheme().onSurface,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Nouveau mot de passe",
                          labelText: "Nouveau mot de passe",
                          suffixIcon: Icons.visibility_off_outlined,
                          controller: passwordController,
                          isPassword: true,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Confirmer votre nouveau mot de passe",
                          labelText: "Confirmer votre nouveau mot de passe",
                          suffixIcon: Icons.visibility_off_outlined,
                          controller: confirmPasswordController,
                          isPassword: true,

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              CustomButton(
                label: "Réinitialiser",
                isDisabled: !isButtonEnabled,
                onPressed: isButtonEnabled
                  ? () {
                  print("Button pressed!");
                }: null,
                color: MaterialTheme.lightScheme().primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
