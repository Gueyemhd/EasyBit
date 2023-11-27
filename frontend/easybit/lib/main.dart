import 'package:easybit/screens/pages/buyBtcOm.dart';
import 'package:easybit/screens/pages/buyBtcWave.dart';
import 'package:easybit/screens/pages/calculatorBTCtoXOF.dart';
import 'package:easybit/screens/pages/loginPage.dart';
import 'package:easybit/screens/pages/nextPage.dart';
import 'package:easybit/screens/pages/registrationpage.dart';
import 'package:easybit/screens/pages/sellBtc.dart';
import 'package:easybit/screens/pages/startedPage.dart';
import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:easybit/screens/widgets/profile.dart';
import 'package:easybit/screens/pages/transfertBitoins.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        "/EasyBit": (context) => const Home(),
        "/registration": (context) => const Registration(),
        "/next": (context) => const NextPage(),
        "/login": (context) => const Login(),
        "/calculatorBTCtoXOF": (context) => const CalculatorBTCtoXOF(),
        "/transfertBitcoins": (context) => const TransfertBitcoins(),
        "/welcome": (context) => const WelcomePage(),
        "/orange": (context) => const BuyBtcOm(),
        "/wave": (context) => const Wave(),
        "/sellbtc": (context) => const SellBtc(),
        "/profile": (context) => const ProfileUser()
      },
      initialRoute: "/calculatorBTCtoXOF",
    );
  }
}
