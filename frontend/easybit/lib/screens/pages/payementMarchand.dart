import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:easybit/screens/widgets/payementMarchand/payementMarchand.body.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class PayementMarchand extends StatefulWidget {
  const PayementMarchand({super.key});

  @override
  State<PayementMarchand> createState() => _PayementMarchandState();
}

class _PayementMarchandState extends State<PayementMarchand> {
  static const String _title = 'Paiement Marchand';

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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 38,
            ),
            tooltip: 'Menu Icon',
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const WelcomePage())),
          ),
        ),
        body: const PayementMarchandBody());
  }
}
