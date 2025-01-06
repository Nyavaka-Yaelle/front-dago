import 'package:flutter/material.dart';
// import 'package:project1/screens/login_screen.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import '../components/horizontal_line.dart';
import '../components/account_text.dart';
import './login_screen.dart';
import './otp_screen.dart';
import '../theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_toggle_switch.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;

  bool isButtonEnabled = false;
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    // Ajouter des écouteurs aux champs obligatoires
    nomController.addListener(_updateButtonState);
    prenomController.addListener(_updateButtonState);
    telController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
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
    // Modifier la couleur selon la position de défilement
    setState(() {
      // appBarColor = colorScheme.surfaceContainerLowest;
      appBarColor = _scrollController.offset > 10
          ? customColor.getColor("surfaceContainerLow").withOpacity(0.24)
          : customColor.getColor("surfaceContainerLowest");
    });
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = nomController.text.isNotEmpty &&
          prenomController.text.isNotEmpty &&
          telController.text.isNotEmpty &&
          passwordController.text.length>=6;
    });
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor, 
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0, color: colorScheme.onSurfaceVariant,), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, 
        elevation: 0, 
        title: Text(
          'Créer un compte',
          style: TextStyle(
            fontFamily: 'Roboto', // Exemple de font family, vous pouvez mettre celui que vous préférez
            fontSize: 21.0, // Exemple de taille de police (fontSize)
            color: colorScheme.onSurface
          ), // Couleur du texte (foregroundColor)
        ),
        foregroundColor: colorScheme.onSurface,        
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        child: Padding(
          // padding: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // CustomToggleSwitch(),
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/images/login_image.svg',
                  height: 48.0,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.0),
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
                            Icons.person_outlined,
                            color: colorScheme.onSurface,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Nom",
                          labelText: "Nom",
                          controller: nomController,
                          isFacultatif: false,
                        ),
                      ),
                    ],
                  ),
                  TableRow( children: [ SizedBox(height: 16.0),SizedBox(height: 16.0)]),
                  TableRow(
                    children: [
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Prénom",
                          labelText: "Prénom",
                          controller: prenomController,
                          isFacultatif: false,
                        ),
                      ),
                    ],
                  ),
                  TableRow( children: [ SizedBox(height: 16.0),SizedBox(height: 16.0)]),
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
                  TableRow( children: [ SizedBox(height: 16.0),SizedBox(height: 16.0)]),
                  TableRow(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 56.0,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.email_outlined,
                            color: colorScheme.onSurface,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Adresse mail (facultatif)",
                          labelText: "Adresse mail (facultatif)",
                          controller: emailController,
                          isEmail: true,
                          isFacultatif: true,
                        ),
                      ),
                    ],
                  ),
                  TableRow( children: [ SizedBox(height: 16.0),SizedBox(height: 16.0)]),
                  TableRow(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 56.0,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.lock_outlined,
                            color: colorScheme.onSurface,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomInput(
                          hintText: "Mot de passe",
                          labelText: "Mot de passe",
                          suffixIcon: Icons.visibility_off_outlined,
                          controller: passwordController,
                          isPassword: true,
                          isFacultatif: false,
                        ),
                      ),
                    ],
                  ),
                  // TableRow( children: [ SizedBox(height: 16.0),SizedBox(height: 16.0)]),
                  // TableRow(
                  //   children: [
                  //     SizedBox(height: 16.0),
                  //     Align(
                  //       alignment: Alignment.center,
                  //       child: CustomInput(
                  //         hintText: "Confirmer votre mot de passe",
                  //         labelText: "Confirmer votre mot de passe",
                  //         suffixIcon: Icons.visibility_off_outlined,
                  //         controller: confirmPasswordController,
                  //         isPassword: true,

                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(height: 4.0),
              CustomButton(
                label: "S'inscrire",
                isDisabled: !isButtonEnabled,
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              numero: telController.text,
                            ),
                          ),
                        );
                      }
                    : null,
                color: colorScheme.primary
              ),
              SizedBox(height: 32.0),
              HorizontalLine(
                color: colorScheme.outlineVariant,
                thickness: 1.0,
              ),
              SizedBox(height: 32.0),
               Align(
                alignment: Alignment.center,
                child:AccountText(
                  message: "Vous avez déjà un compte ?",
                  actionText: "Connectez-vous",
                  messageColor: colorScheme.onSurface,
                  actionTextColor: colorScheme.primary,
                  onActionTap: () {
                    print("Naviguer vers login");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
