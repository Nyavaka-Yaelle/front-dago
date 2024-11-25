import 'package:flutter/material.dart';
import '../components/opt_input_field.dart';
import '../components/custom_button.dart';
import '../theme.dart';

class OtpScreen extends StatefulWidget {
  final bool isvalidate;
  final String numero;

  const OtpScreen({
    Key? key,
    this.isvalidate = false, // Valeur par défaut
    required this.numero,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final ScrollController _scrollController = ScrollController();
  Color appBarColor = MaterialTheme.lightScheme().surfaceContainerLowest;

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

  void _onScroll() {
    setState(() {
      appBarColor = _scrollController.offset > 50
          ? MaterialTheme.lightScheme().surfaceContainerLowest
          : MaterialTheme.lightScheme().surfaceContainerLowest;
    });
  }
  String getNumero() {
    String visiblePart = widget.numero.substring(1, widget.numero.length); // Partie visible
    return '+ 261 '+visiblePart;
  }
  String hintNumero() {
    String visiblePart = widget.numero.substring(1, widget.numero.length - 9); // Partie visible
    String hiddenPart = '** *** **'; // Partie masquée
    return '+ 261 '+visiblePart + hiddenPart;
    // return '+261 3* ** *** **';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: appBarColor,
        title: const Text('Vérification'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.isvalidate) ...[
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/check_circle.png',
                    height: 64.0,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Votre numéro a été bien validé',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: MaterialTheme.lightScheme().secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    // widget.numero,
                    getNumero(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: MaterialTheme.lightScheme().onSurface,
                    ),
                  ),
                ),
              ] ,
              if (!widget.isvalidate) ...[ 
                // Column( 
                // children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Un code a été envoyé au numéro',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    hintNumero(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: MaterialTheme.lightScheme().onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const OtpInputField(), // Composant OTP
                const SizedBox(height: 56.0),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomButton(
                    label: "Valider",
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              isvalidate: true,
                              numero: widget.numero,
                            ),
                          ),
                        );
                      });
                    },
                    color: MaterialTheme.lightScheme().primary,
                  ),
                ),
              ],
            // )],
            ],
          ),
        ),
      ),
    );
  }
}
