import 'package:easybit/constants.dart';
import 'package:easybit/screens/loginPage.dart';
import 'package:easybit/screens/registrationPage.dart';
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
    return Center(
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -190,
                left: -200,
                child: Container(
                  height: MediaQuery.of(context).size.height * 2,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, bluelogo],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: bluelogo,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("images/background.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, bluelogo],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 25,
                child: Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 70,
                bottom: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.11),
                    RoundedButton(
                      text: "Se connecter",
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    RoundedButton2(
                      text: "S'inscrire",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Registration();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}