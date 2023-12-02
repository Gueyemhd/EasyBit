import 'package:easybit/screens/widgets/transfertBTC/passwordField.dart';
import 'package:easybit/screens/widgets/transfertBTC/submitBtn2.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class SubmitBtn extends StatefulWidget {
  const SubmitBtn({super.key});

  @override
  State<SubmitBtn> createState() => _SubmitBtnState();
}

class _SubmitBtnState extends State<SubmitBtn> {
  Future<void> _finalAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(
            'Entrer votre mot de passe pour valider le transfert',
            style: TextStyle(fontSize: 12),
          ),
          content: PasswordField(),
          actions: <Widget>[
            SubmitBtn2(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //
      ),
      child: ElevatedButton(
        onPressed: _finalAlertDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: trsftcolor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: const Text('Valider'),
      ),
    );
  }
}
