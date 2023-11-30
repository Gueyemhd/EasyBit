import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? couleur;
  final String texte;
  final Function press;
  const Button(
      {super.key,
      required this.press,
      required this.couleur,
      required this.texte});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: couleur,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Text(
        texte,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        press;
      },
    );
  }
}
