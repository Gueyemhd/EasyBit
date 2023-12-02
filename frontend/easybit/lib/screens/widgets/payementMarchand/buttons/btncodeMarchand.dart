import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class CodeMarchandBtn extends StatefulWidget {
  const CodeMarchandBtn({super.key});

  @override
  State<CodeMarchandBtn> createState() => _CodeMarchandBtnState();
}

class _CodeMarchandBtnState extends State<CodeMarchandBtn> {
  bool change = true;
  int index = -1;
  Color enableColor = trsftcolor;
  Color disableColor = Colors.white;

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
              color: Colors.white, //container color
              borderRadius: BorderRadius.circular(50),
            ),
            height: 70,
            child: TextButton(
              onPressed: () {
                setState(() {
                  index = 0;
                  change = !change;
                  //  valeur = '';
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: index == 0 ? enableColor : disableColor,
              ),
              child: const Text(
                "code marchand",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}
