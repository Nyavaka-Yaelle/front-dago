import 'package:flutter/material.dart';
// import 'package:project1/screens/login_screen.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import '../components/horizontal_line.dart';
import '../components/account_text.dart';
import './login_screen.dart';
import './otp_screen.dart';
import '../theme.dart';

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

  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
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
      isButtonEnabled = nomController.text.isNotEmpty &&
          prenomController.text.isNotEmpty &&
          telController.text.isNotEmpty &&
          passwordController.text.length>=6;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor, // Couleur dynamique
        title: Text('Créer un compte'),
        
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        child: Padding(
          // padding: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/login_image.png',
                  height: 56.0,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 12.0),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(0.1),
                  1: FlexColumnWidth(0.9),
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
                            color: MaterialTheme.lightScheme().onSurface,
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
                            color: MaterialTheme.lightScheme().onSurface,
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
                            color: MaterialTheme.lightScheme().onSurface,
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
                            color: MaterialTheme.lightScheme().onSurface,
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
                color: MaterialTheme.lightScheme().primary
              ),
              SizedBox(height: 32.0),
              HorizontalLine(
                color: MaterialTheme.lightScheme().outlineVariant,
                thickness: 1.0,
              ),
              SizedBox(height: 32.0),
               Align(
                alignment: Alignment.center,
                child:AccountText(
                  message: "Vous avez déjà un compte ?",
                  actionText: "Connectez-vous",
                  messageColor: MaterialTheme.lightScheme().onSurface,
                  actionTextColor: MaterialTheme.lightScheme().primary,
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
