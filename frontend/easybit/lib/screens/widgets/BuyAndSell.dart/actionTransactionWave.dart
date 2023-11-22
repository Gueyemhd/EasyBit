import 'package:flutter/material.dart';

class ButtonTransactionWave extends StatelessWidget {
  final Function press;
  const ButtonTransactionWave({super.key, required this.press});

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
          backgroundColor: const Color.fromRGBO(29, 200, 255, 1),
        ),
        child: const Text(
          "ACHETER",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          press;
        },
      ),
    );
  }
}
