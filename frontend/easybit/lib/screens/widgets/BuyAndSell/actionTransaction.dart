import 'package:flutter/material.dart';

class ButtonTransaction extends StatelessWidget {
  final Color? couleur;
  final String texte;
  final Function() press;
  const ButtonTransaction(
      {super.key,
      required this.press,
      required this.couleur,
      required this.texte});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: couleur,
        ),
        onPressed: press,
        child: Text(
          texte,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
