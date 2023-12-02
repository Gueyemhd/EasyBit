import 'package:flutter/material.dart';

class Texte extends StatelessWidget {
  final String texte;

  const Texte({
    super.key,
    required this.texte,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
    );
  }
}
