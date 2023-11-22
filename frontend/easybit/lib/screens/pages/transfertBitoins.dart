import 'package:easybit/screens/widgets/transfertBTC/transfertBitcoins.body.dart';
import 'package:flutter/material.dart';

class TransfertBitcoins extends StatefulWidget {
  const TransfertBitcoins({super.key});

  @override
  State<TransfertBitcoins> createState() => _TransfertBitcoinsState();
}

class _TransfertBitcoinsState extends State<TransfertBitcoins> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: true, body: TransfertBitcoinsBody());
  }
}
