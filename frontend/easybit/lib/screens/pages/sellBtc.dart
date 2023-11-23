import 'package:easybit/screens/widgets/BuyAndSell.dart/sellBitcoin.dart';
import 'package:flutter/material.dart';

class SellBtc extends StatefulWidget {
  const SellBtc({super.key});

  @override
  State<SellBtc> createState() => _SellBtcState();
}

class _SellBtcState extends State<SellBtc> {
  @override
  Widget build(BuildContext context) {
    return const SellBitcoin();
  }
}
