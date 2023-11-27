import 'package:easybit/screens/widgets/welcome/welcome.body.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: true, body: WelcomeBody());
  }
}
