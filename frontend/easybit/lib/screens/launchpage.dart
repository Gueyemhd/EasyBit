import 'package:easybit/widgets/launch/launch.body.dart';
import 'package:flutter/material.dart';

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: true, body: LaunchBody());
  }
}
