import 'package:easybit/screens/widgets/registration/next.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: true, body: Next());
  }
}
