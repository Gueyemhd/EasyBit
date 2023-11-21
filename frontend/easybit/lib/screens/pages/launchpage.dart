import 'package:easybit/screens/widgets/drawer/drawer.dart';
import 'package:easybit/screens/widgets/launch/launch.body.dart';
import 'package:flutter/material.dart';

class Launch extends StatefulWidget {
  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  static const String _title = 'Lancement';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: true,
        //    drawer: const MyDrawer(),
        /*   appBar: AppBar(
          title: const Text(_title),
          backgroundColor: const Color.fromARGB(237, 12, 90, 154),
        ),*/
        body: LaunchBody());
  }
}
