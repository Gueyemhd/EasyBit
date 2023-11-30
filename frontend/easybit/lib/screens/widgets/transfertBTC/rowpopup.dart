import 'package:easybit/screens/widgets/transfertBTC/data.dart';
import 'package:easybit/screens/widgets/transfertBTC/textmodel.dart';
import 'package:flutter/material.dart';

class Rowpopup extends StatefulWidget {
  const Rowpopup({super.key});

  @override
  State<Rowpopup> createState() => _RowpopupState();
}

class _RowpopupState extends State<Rowpopup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
        const Icon(
          Icons.money,
          color: Colors.black,
          size: 25,
        ),
        const Texte(
          texte: "Montant",
        ),
        const Data(texte: "12,750 SAT"),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
      ],
    );
  }
}
