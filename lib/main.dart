import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/page_info.dart';
import 'screens/home_screen.dart';
import 'screens/foodee_home_screen.dart';
import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive la bande "DEBUG"
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme.light(
          outline:
              DagoTheme.outline, // Utiliser la couleur définie dans DagoTheme
        ),
      ),
      // home: PageInfo(),
      // home: FoodeeHomeScreen(),
      // home: HomeScreen(),
      home: SplashScreen(),
    );
  }
}
