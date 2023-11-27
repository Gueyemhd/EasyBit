import 'package:easybit/screens/widgets/BuyAndSell/wave.dart';
import 'package:flutter/material.dart';

class Wave extends StatefulWidget {
  const Wave({super.key});

  @override
  State<Wave> createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  @override
  Widget build(BuildContext context) {
    return const BuyBtcWave();
  }
}
