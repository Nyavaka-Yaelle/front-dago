import 'package:flutter/material.dart';
import 'screens/maison_screen.dart';
import 'package:project1/screens/wallet_configuration.dart';
import 'screens/login_screen.dart';
import 'screens/page_info.dart';
import 'screens/home_screen.dart';
import 'screens/foodee_home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/food_card_extended.dart';
import 'screens/your_card_screen.dart';
import 'screens/wallet_configuration.dart';
import 'screens/fund_added_screen.dart';
import 'screens/add_fund_screen.dart';
import 'screens/notif_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/change_profile_picture.dart';
import 'screens/account_profile.dart';
import 'screens/fooder_profile.dart';
import 'screens/parameter_screen.dart';
import 'screens/adresses_screen.dart';
import 'screens/history_screen.dart';
import 'screens/edit_password_screen.dart';
import 'components/await_fooder.dart';
import 'components/await_adding_fund.dart';
import 'components/restaurant_resume.dart';
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
      theme: MaterialTheme.light(),
      darkTheme: MaterialTheme.dark(),
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      // ),

      // home: PageInfo(),
      // home: AwaitFooder(nomResto: "Pakopako",),
      // home: AwaitAddingFund(),
      /*
      home: FoodCardExtended(
        nomPlat: "Biriani akoho machiaka",
        nomResto: "Pakopako",
        descriptionPlat: "Ity zengy akoho karana tafa teo aminy fiainana miaraka Vary, Akoho, Epices, Sauce, Lasary",
        descriptionResto: "Cuisine traditionnelle de Majunga",
        ), //soratras
        */
      // home: FoodeeHomeScreen(),
      // home: FooderProfile(),
      // home: YourCardScreen(),
      // home: AddFundScreen(),
      // home: WalletConfiguration(),
      // home: FundAddedScreen(), //soratra
      // home: HomeScreen(),
      // home: SplashScreen(),
      // home: NotifScreen(), //soratra
      // home: LoginScreen(), // login ko,mdp, profile ambany 3 io
      // home: ProfileScreen(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
      // home: ChangeProfilePicture(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
      // home: AccountProfile(),
      home: ParameterScreen(),
      // home: HistoryScreen(),
      // home: AdressesScreen(),
      // home: MaisonScreen(),
      // home: EditPasswordScreen(),
    );
  }
}
