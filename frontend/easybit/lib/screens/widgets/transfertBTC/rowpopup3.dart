import 'package:easybit/screens/widgets/transfertBTC/data.dart';
import 'package:easybit/screens/widgets/transfertBTC/textmodel.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Rowpopup3 extends StatefulWidget {
  const Rowpopup3({super.key});

  @override
  State<Rowpopup3> createState() => _Rowpopup3State();
}

class _Rowpopup3State extends State<Rowpopup3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        const Icon(
          Icons.person,
          color: Colors.black,
          size: 25,
        ),
        const Texte(
          texte: "Bénéficiaire",
        ),
        const Data(texte: "Mouhamed01"),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
      ],
    );
  }
}
