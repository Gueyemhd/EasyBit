import 'package:easybit/screens/calculatorBTCtoXOF.dart';
import 'package:flutter/material.dart';

class BTCtoXOF extends StatefulWidget {
  const BTCtoXOF({super.key});

  @override
  State<BTCtoXOF> createState() => _BTCtoXOFState();
}

class _BTCtoXOFState extends State<BTCtoXOF> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    Widget btcField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.9,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 2)),
            height: 60,
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer le montant en BTC ou SAT';
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(237, 12, 90, 154),
                    size: 45,
                  ),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 12)),
            ),
          ),
        ],
      );
    }

    Widget xofField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.9,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 2)),
            height: 60,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(237, 12, 90, 154),
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            btcField(),
            const SizedBox(height: 10),
            IconButton(
              iconSize: 70,
              icon: const Icon(
                Icons.change_circle,
                color: Color.fromARGB(237, 12, 90, 154),
              ),
              tooltip: 'désactiver compte',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CalculatorBTCtoXOF())),
            ),
            const SizedBox(height: 10),
            xofField(),
          ]),
    );
  }
}
