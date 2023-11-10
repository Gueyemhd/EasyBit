import 'package:easybit/constants.dart';
import 'package:flutter/material.dart';

//RoundedButton(text: "Se connecter", press: () {}), // à placer là où on veut l'appeler

class RoundedButton2 extends StatelessWidget {
  final String text;
  final Function press;
  final Color bordercolor;
  const RoundedButton2({
    Key? key,
    required this.text,
    required this.press,
    this.bordercolor = gold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Container(
            decoration: BoxDecoration(
                color: btnsignup, //container color
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: bordercolor, width: 2)),
            height: 70,
            child: TextButton(
              onPressed: () {},
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            )),
      ),
    );
  }
}
