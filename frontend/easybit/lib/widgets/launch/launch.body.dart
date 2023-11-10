//import 'package:easybit/background.dart';
import 'package:easybit/screens/registrationpage.dart';
import 'package:easybit/screens/startedPage.dart';
import 'package:easybit/widgets/launch/launch.body.roundedButton.dart';
import 'package:easybit/widgets/launch/launch.body.roundedButton2.dart';
import 'package:flutter/material.dart';

class LaunchBody extends StatefulWidget {
  const LaunchBody({super.key});

  @override
  State<LaunchBody> createState() => _LaunchBodyState();
}

class _LaunchBodyState extends State<LaunchBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage("images/logo.png"),
            fit: BoxFit.cover,
            width: 250,
          ),
          SizedBox(height: size.height * 0.11),
          RoundedButton(
            text: "Se connecter",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
              }));
            },
          ),
          SizedBox(height: size.height * 0.02),
          RoundedButton2(
            text: "S'inscrire",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegistrationPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
