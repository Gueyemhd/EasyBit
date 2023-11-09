import 'package:easybit/background.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: size.height * 0.1,
              width: size.width * 0.5,
              child: const Image(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.cover,
                width: 250,
              ),
              //    color: Colors.blue,
            ),
          ]),
    );
  }
}
