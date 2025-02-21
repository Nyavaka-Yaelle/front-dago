import 'package:flutter/material.dart';
import 'dart:ui'; // Importez le package dart:ui pour ImageFilter
import 'package:flutter_svg/flutter_svg.dart'; // Importez le package flutter_svg pour utiliser des fichiers SVG
import '../../components/opt_input_field.dart'; // Assurez-vous d'importer votre composant OTPInputField
import '../../theme.dart';

class CreatePINScreen extends StatefulWidget {
  @override
  _CreatePINScreenState createState() => _CreatePINScreenState();
}

class _CreatePINScreenState extends State<CreatePINScreen> {
  int pin = 0;
  int pinVerify = 0;
  bool _isError = false;
  bool _isConfirming = false;
  final GlobalKey<OtpInputFieldState> _otpInputFieldKey = GlobalKey<OtpInputFieldState>();

  void _showBlurDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    ColorManager customColor = ColorManager(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/shield.svg',
                  height: 76.0,
                  width: 76.0,
                  color: colorScheme.primary,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 8),
                Text('PIN créé avec succès', style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22.0,
                  color: colorScheme.onSurface,
                )),
              ],
            ),
            content: Text('Votre code PIN a été créé et est maintenant prêt à être utilisé.'
              ,style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
              color: colorScheme.tertiary,
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );

    // Fermer automatiquement le dialogue après 3 secondes
    Future.delayed(Duration(seconds: 3), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  void _validatePins() {
    if (_isConfirming) {
      if (_otpInputFieldKey.currentState?.areAllFieldsFilled() ?? false) {
        if (pin == pinVerify) {
          // Handle PIN submission
          print('PIN entered: $pin');
          _showBlurDialog();
        } else {
          setState(() {
            _isError = true;
          });
        }
      }
    } else {
      if (_otpInputFieldKey.currentState?.areAllFieldsFilled() ?? false) {
        setState(() {
          pin = int.parse(_otpInputFieldKey.currentState!.controllers.map((c) => c.text).join());
          _isConfirming = true;
          _isError = false;
          _otpInputFieldKey.currentState?.clearFields(); // Vider le champ de saisie
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        // title: Text('Create PIN'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24.0,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, size: 16),
            onPressed: () {
              // Action pour l'icône de question
              _showBlurDialog();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  _isConfirming ? 'Réécrivez votre PIN' : 'Créez votre PIN',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 22, color: colorScheme.onSurface),
                ),
                SizedBox(height: 13),
                Container(
                  child: Text(
                    'Afin de sécuriser vos transactions, créer un PIN code à 4 chiffres qui vous est unique.',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: colorScheme.tertiary, letterSpacing: 0.4),
                  ),
                ),
                SizedBox(height: 24),
                OtpInputField(
                  key: _otpInputFieldKey,
                  length: 4, // Nombre de champs
                  onChanged: (value) {
                    setState(() {
                      if (_isConfirming) {
                        pinVerify = int.parse(value);
                      } else {
                        pin = int.parse(value);
                      }
                      _isError = false;
                    });
                    _validatePins();
                  },
                  error: _isError,
                ),
                SizedBox(height: 20),
                if (_isError)
                  Text(
                    'Les PINs ne correspondent pas. Veuillez réessayer.',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          Positioned(
            right: -25,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Transform.rotate(
              angle: -32 * 3.141592653589793 / 180, // Convertir les degrés en radians
              child: SvgPicture.asset(
                'assets/images/shield.svg',
                height: 146.0,
                width: 146.0,
                color: colorScheme.tertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}