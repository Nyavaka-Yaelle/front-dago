import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/text_icon_button.dart';
import '../components/profile_detail_item.dart';
import '../components/custom_input.dart';
import '../theme.dart';

class EditPasswordScreen extends StatefulWidget {
  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  late Color appBarColor;
  late Color bodyColor;
  late ColorManager customColor;
  
  bool isButtonEnabled = false;
  int state = 0;
  String formatIt(String input) {
    return List.generate(input.length, (_) => '• ').join();
  }

  String getLabelNext() {
    String label = "Modifier";
    if (state == 1) label = "Suivant";
    if (state == 3) label = "Terminer";
    return label;
  }
  String getTitle() {
    String label = "Vos identifiants de connexion, en particulier votre mot de passe est confidentiel.";
    if (state == 1) label = "Pour continuer, veuillez confirmer votre indetité";
    if (state == 2) label = "Veuillez entrer votre nouveau mot de passe";
    return label;
  }
   String getSubtitle() {
    String label = "Ne jamais divulger votre mot de passe, afin de préserver l’intégrité et la sécurité de votre compte.";
    if (state == 1) label = "";
    if (state == 2) label = "Nous vous conseillons de combiner des lettres, des chiffres, des symboles.";
    return label;
  }

  void incrementState() {
    setState(() {
      state++;
      if (state > 3) state = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bodyColor,
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: colorScheme.onSurfaceVariant,
          ), // Flèche "Retour"
          onPressed: () {
            print("Retour à l'écran précédent");
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        backgroundColor: appBarColor,
        elevation: 0,
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
              Text(
                "Mot de passe",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: colorScheme.onSurface),
              ),
              SizedBox(height: 24),
              Text(
                getTitle(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              Text(
                getSubtitle(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.tertiary,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 24),
              Column(children: [
                if(state==0 || state==3)ProfileDetailItem(
                  icon: Icons.lock_outline_rounded,
                  title: "Mot de passe",
                  detail: formatIt("123456"),
                ),
                if(state==1) CustomInput(
                  hintText: "Saisissez votre mot de passe",
                  labelText: "Saisissez votre mot de passe",
                  suffixIcon: Icons.visibility_off_outlined,
                  controller: currentPasswordController,
                  isPassword: true,
                  isFacultatif: false,
                ),
                if(state==2)  
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
                              color: colorScheme.onSurface,
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
                  ]),
              ]),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (state < 3)
                    TextIconButton(
                        label: "Annuler",
                        color: colorScheme.primary),
                  SizedBox(width: 24),
                  CustomButton(
                      outline: state == 3,
                      label: getLabelNext(),
                      onPressed: () => incrementState(),
                      color: colorScheme.primary)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
