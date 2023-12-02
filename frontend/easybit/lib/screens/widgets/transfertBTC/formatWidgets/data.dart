import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final String texte;

  const Data({
    super.key,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: const TextStyle(color: bluelogo, fontSize: 15),
    );
  }
}
