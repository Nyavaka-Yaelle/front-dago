import 'package:flutter/material.dart';
import '../components/custom_input.dart';
import '../components/custom_button.dart';
import '../components/horizontal_line.dart';
import '../components/account_text.dart';
import '../components/toast_util.dart';
import './signup_screen.dart';
import './splash_screen.dart';
import './forgot_password.dart';
import '../theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Color appBarColor =
      MaterialTheme.lightScheme().surfaceContainerLowest; // Couleur par défaut
  bool isButtonEnabled = false;
  String loginError = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

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
      isButtonEnabled =
          telController.text.isNotEmpty && passwordController.text.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            // Navigator.pop(context); // Retour à l'écran précédent
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          },
        ),
        backgroundColor: appBarColor, // Couleur dynamique
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Ajout du ScrollController
        // ToastUtil.showToast('Le numéro doit contenir 10 chiffres');
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
              Text(
                'Connexion',
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  'Accéder à dagô pour des services faites sur mesure pour vous.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
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
                  TableRow(
                    children: [
                      SizedBox(height: 16.0),
                      SizedBox(height: 16.0),
                    ],
                  ),
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
                          hintText: "Entrez votre mot de passe",
                          labelText: "Mot de passe",
                          suffixIcon: Icons.visibility_off_outlined,
                          controller: passwordController,
                          isPassword: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // Action à effectuer lors du clic
                    print('Mot de passe oublié cliqué');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      // decoration: TextDecoration.underline,
                      color: MaterialTheme.lightScheme().secondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              CustomButton(
                  label: "Connexion",
                  isDisabled: !isButtonEnabled,
                  onPressed: isButtonEnabled
                      ? () {
                          print("Button pressed!");
                          if (loginError != null || loginError == '') {
                            ToastUtil.showToast(
                                'Numéro ou mot de passe erroné'); // Afficher un toast d'erreur pour le téléphone
                          }
                        }
                      : null,
                  color: MaterialTheme.lightScheme().primary),
              SizedBox(height: 32.0),
              HorizontalLine(
                color: MaterialTheme.lightScheme().outlineVariant,
                thickness: 1.0,
              ),
              SizedBox(height: 32.0),
              Align(
                alignment: Alignment.center,
                child: AccountText(
                  message: "Vous n'avez pas encore de compte ?",
                  actionText: "Inscrivez-vous",
                  messageColor: MaterialTheme.lightScheme().onSurface,
                  actionTextColor: MaterialTheme.lightScheme().primary,
                  onActionTap: () {
                    print("Naviguer vers l'inscription");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
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
