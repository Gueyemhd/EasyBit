import 'package:flutter/material.dart';

class Qrcode extends StatelessWidget {
  const Qrcode({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset("images/qrcode.jpg",
        width: size.width * 0.2, height: size.height * 0.1);
  }
}
