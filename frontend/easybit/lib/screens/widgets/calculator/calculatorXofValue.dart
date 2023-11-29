import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class CalculatorXofValue extends StatelessWidget {
  final String valeur;
  const CalculatorXofValue({super.key, required this.valeur});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: containerTexfieldColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valeur,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                    child: Text(
                      'XOF',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: linearColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
    ;
  }
}
