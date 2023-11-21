import 'package:easybit/screens/pages/calculatorXOFtoBTC.dart';
import 'package:easybit/screens/widgets/calculator/calculatorBTCtoXOF.body.dart';
import 'package:flutter/material.dart';

class CalculatorBTCtoXOF extends StatefulWidget {
  const CalculatorBTCtoXOF({super.key});

  @override
  State<CalculatorBTCtoXOF> createState() => _CalculatorBTCtoXOFState();
}

class _CalculatorBTCtoXOFState extends State<CalculatorBTCtoXOF> {
  static const String _title = 'Calculateur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(237, 12, 90, 154),
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
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CalculatorXOFtoBTC())),
          ),
        ),
        body: BTCtoXOF());
  }
}
