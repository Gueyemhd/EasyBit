import 'package:easybit/constants.dart';
import 'package:easybit/screens/launchPage.dart';
import 'package:easybit/screens/loginPage.dart';
import 'package:easybit/screens/registrationPage.dart';
import 'package:easybit/screens/startedPage.dart';
import 'package:easybit/widgets/registration/next.dart';
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
      theme: ThemeData(
          //  primaryColor: bluelogo,
          ),
      routes: {
        "/started": (context) => const Home(),
        "/launch": (context) => const Launch(),
        "/registration": (context) => const Registration(),
        "/next": (context) => const Next(),
        "/login": (context) => const Login(),
      },
      initialRoute: "/started",
    );
  }
}
