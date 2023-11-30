import 'package:easybit/screens/widgets/transfertBTC/formatWidgets/data.dart';
import 'package:easybit/screens/widgets/transfertBTC/formatWidgets/textmodel.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Rowpopup2 extends StatefulWidget {
  const Rowpopup2({super.key});

  @override
  State<Rowpopup2> createState() => _Rowpopup2State();
}

class _Rowpopup2State extends State<Rowpopup2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 75,
        ),
        const Icon(
          Icons.percent,
          color: Colors.black,
          size: 25,
        ),
        const Texte(
          texte: "Frais",
        ),
        const Data(texte: "63,75"),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
