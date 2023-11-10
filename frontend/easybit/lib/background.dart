import 'package:easybit/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required Column child});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white70,
              offset: Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
          ],
          // boxShadow: [ BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(0, 2))],
          image: DecorationImage(
            //scale: 3.0,
            //opacity: 6.0,
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              bluelogo,
            ],
          ),
        ),
        child: Column());
  }
}
