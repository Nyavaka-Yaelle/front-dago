import 'package:flutter/material.dart';
import './theme.dart'; // Remplacez `your_project_name` par le nom de votre projet

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark? true: false;
  bool get isDarkMode => _isDarkMode;

  // ThemeData get currentTheme =>  _isDarkMode ? MaterialTheme.dark() : MaterialTheme.light();

  ThemeData get currentTheme {
    // Vérifie si le thème du système est sombre
    // bool isSystemDarkMode =
    //     WidgetsBinding.instance.window.platformBrightness == Brightness.dark;

    // Utilise le thème sombre si le système est en mode sombre ou si l'utilisateur a basculé le thème sombre manuellement
    return (isDarkMode) ? MaterialTheme.dark() : MaterialTheme.light();
    // if(isSystemDarkMode)
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
