import 'package:easybit/screens/launchPage.dart';
import 'package:easybit/screens/pages/calculatorBTCtoXOF.dart';
import 'package:easybit/screens/pages/calculatorXOFtoBTC.dart';
import 'package:easybit/screens/pages/loginPage.dart';
import 'package:easybit/screens/pages/nextPage.dart';
import 'package:easybit/screens/pages/startedPage.dart';
import 'package:easybit/screens/registrationPage.dart';
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
        "/launch": (context) => const Launch(),
        "/registration": (context) => const Registration(),
        "/next": (context) => const NextPage(),
        "/login": (context) => const Login(),
        "/CalculatorBTCtoXOF": (context) => const CalculatorBTCtoXOF(),
        "/CalculatorXOFtoBTC": (context) => const CalculatorXOFtoBTC()
      },
      initialRoute: "/CalculatorBTCtoXOF",
    );
  }
}
