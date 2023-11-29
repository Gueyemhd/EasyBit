import 'package:easybit/screens/widgets/transfertBTC/animated.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class SubmitBtn2 extends StatefulWidget {
  const SubmitBtn2({super.key});

  @override
  State<SubmitBtn2> createState() => _SubmitBtn2State();
}

class _SubmitBtn2State extends State<SubmitBtn2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Animated()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: bluelogo,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text('Valider'),
          )),
    );
  }
}
