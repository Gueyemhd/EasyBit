import 'package:easybit/screens/pages/transfertBitoins.dart';
import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:flutter/material.dart';

class Quit extends StatelessWidget {
  const Quit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TransfertBitcoins()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(235, 228, 223, 223),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        child: const Text(
          'Quitter',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
