import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class RoundedBtn2 extends StatelessWidget {
  final String text;
  final Function press;
  final Color fillcolor;
  const RoundedBtn2(
      {Key? key,
      required this.text,
      required this.press,
      required this.fillcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      width: size.width * 0.5,
      height: size.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Container(
            decoration: BoxDecoration(
              color: fillcolor, //container color
              borderRadius: BorderRadius.circular(50),
            ),
            height: 70,
            child: TextButton(
              onPressed: () {
                press;
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: trsftcolor, // Background Color
              ),
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}
