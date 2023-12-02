import 'package:easybit/screens/pages/navigationPage.dart';
import 'package:easybit/screens/widgets/transfertBTC/bodyTransfert/transfertBitcoins.body.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class TransfertBitcoins extends StatelessWidget {
  static const String _title = 'Transférer des bitcoins';

  const TransfertBitcoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: trsftcolor,
          title: const Text(
            _title,
            style: TextStyle(fontSize: 22),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 80,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0)),
          ),
          elevation: 0.00,
          actions: const <Widget>[],
          leading: const BackButton(color: Colors.white),
        ),
        body: const TransfertBitcoinsBody());
  }
}
