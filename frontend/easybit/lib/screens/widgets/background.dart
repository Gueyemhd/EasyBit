import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required Column child});

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
                left: -150,
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
                      colors: [Colors.white, Color.fromARGB(166, 6, 68, 119)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 80,
                top: 175,
                child: Container(
                  height: 300,
                  width: 250,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 180,
                bottom: 25,
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/load.gif"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
