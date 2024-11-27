import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/page_info.dart';
import 'screens/home_screen.dart';
import 'screens/foodee_home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/food_card_extended.dart';
import 'screens/your_card_screen.dart';
import 'components/await_fooder.dart';
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
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(
          outline:
              DagoTheme.outline, // Utiliser la couleur définie dans DagoTheme
        ),
      ),
      // home: PageInfo(),
      // home: AwaitFooder(nomResto: "Pakopako",),
      home: FoodCardExtended(
        nomPlat: "Biriani akoho machiaka",
        nomResto: "Pakopako",
        descriptionPlat: "Ity zengy akoho karana tafa teo aminy fiainana miaraka Vary, Akoho, Epices, Sauce, Lasary",
        descriptionResto: "Cuisine traditionnelle de Majunga",
        ),
      // home: FoodeeHomeScreen(),
      // home: YourCardSreen(),
      // home: HomeScreen(),
      // home: SplashScreen(),
      // home: LoginScreen(),
    );
  }
}
