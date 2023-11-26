import 'package:flutter/material.dart';

class margin extends StatelessWidget {
  const margin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 35,
    );
  }
}
