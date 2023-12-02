import 'package:easybit/screens/widgets/payementMarchand/buttons/btnQRcode.dart';
import 'package:easybit/screens/widgets/payementMarchand/buttons/btncodeMarchand.dart';
import 'package:easybit/screens/widgets/payementMarchand/buttons/roundedBtn2.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class ContainerMarchand extends StatefulWidget {
  const ContainerMarchand({super.key});

  @override
  State<ContainerMarchand> createState() => _ContainerMarchandState();
}

class _ContainerMarchandState extends State<ContainerMarchand> {
  bool change = true;
  int index = -1;
  Color enableColor = trsftcolor;
  Color disableColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.09,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: trsftcolor, width: 1)),
      child: const Row(children: [
        // RoundedBtn2(
        //   text: "code marchand",
        //   fillcolor: Colors.white,
        //   press: () {
        //     setState(() {
        //       index = 0;
        //       change = !change;
        //       //  valeur = '';
        //     });
        //   },
        // ),
        CodeMarchandBtn(),
        QrcodeBtn(),
      ]),
    );
  }
}
