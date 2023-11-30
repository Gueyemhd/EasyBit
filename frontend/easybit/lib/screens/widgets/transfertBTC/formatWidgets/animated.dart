import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      text: "Transfert effectué",
      color: bluelogo,
      width: 290,
      height: 90,
      pressEvent: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          showCloseIcon: true,
          title: "Succès",
          desc: "Transaction réussie",
          btnOkOnPress: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WelcomePage())),
        ).show();
      },
    );
  }
}
