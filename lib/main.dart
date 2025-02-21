import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/ridee_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/forgot_password.dart';
import 'package:provider/provider.dart';
import 'screens/maison_screen.dart';
import 'screens/wallet_configuration.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/page_info.dart';
import 'screens/home_screen.dart';
import 'screens/foodee_home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/food_card_extended.dart';
import 'screens/your_card_screen.dart';
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

import 'screens/custom_components.dart';
import 'screens/maj/create_PIN.dart';

import 'components/await_fooder.dart';
import 'components/await_adding_fund.dart';
import 'components/restaurant_resume.dart';
import 'components/services_card.dart';
import 'theme.dart';
import 'theme_notifier.dart'; // Importez le ThemeNotifier

void main() {
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(),
          child: MyApp(),
        ),
      );
    });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false, 
          theme: themeNotifier.currentTheme,
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
          // home: RideeScreen(),

          // home: CustomComponents(),
          home: CreatePINScreen(),

          // home: ServicesCard(),
          // home: SplashScreen(),
          // home: NotifScreen(), //soratra
          
          // home: ProfileScreen(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
          // home: ChangeProfilePicture(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
          // home: AccountProfile(),

          // home: ParameterScreen(),
          // home: HistoryScreen(),
          // home: AdressesScreen(),
          // home: MaisonScreen(),

          // home: LoginScreen(), // login ko,mdp, profile ambany 3 io
          // home: SignupScreen(), 
          // home: ForgotPassword(), 
          // home: EditPasswordScreen(), 
          // home: OtpScreen(), 
          routes: {
            '/ridee': (context) => RideeScreen(),
            '/maison': (context) => MaisonScreen(),
            '/wallet_configuration': (context) => WalletConfiguration(),
            '/login': (context) => LoginScreen(),
            '/page_info': (context) => PageInfo(),
            '/home': (context) => HomeScreen(),
            '/foodee_home': (context) => FoodeeHomeScreen(),
            '/splash': (context) => SplashScreen(),
            '/food_card_extended': (context) => FoodCardExtended(
              nomPlat: "Biriani akoho machiaka",
              nomResto: "Pakopako",
              descriptionPlat: "Ity zengy akoho karana tafa teo aminy fiainana miaraka Vary, Akoho, Epices, Sauce, Lasary",
              descriptionResto: "Cuisine traditionnelle de Majunga",
            ),
            '/your_card': (context) => YourCardScreen(),
            '/fund_added': (context) => FundAddedScreen(),
            '/add_fund': (context) => AddFundScreen(),
            '/notif': (context) => NotifScreen(),
            '/profile': (context) => ProfileScreen(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
            '/change_profile_picture': (context) => ChangeProfilePicture(username: "Bema Van Astrea", email: "bema.astrea@theworld.com"),
            '/account_profile': (context) => AccountProfile(),
            '/fooder_profile': (context) => FooderProfile(),
            '/parameter': (context) => ParameterScreen(),
            '/history': (context) => HistoryScreen(),
            '/adresses': (context) => AdressesScreen(),
            '/await_fooder': (context) => AwaitFooder(nomResto: "Pakopako"),
            '/await_adding_fund': (context) => AwaitAddingFund(),
            '/edit_password': (context) => EditPasswordScreen(),
          },
        );
      },
    );
  }
}