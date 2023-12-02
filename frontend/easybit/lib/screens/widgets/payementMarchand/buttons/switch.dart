import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool switchOn = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlutterSwitch(
      value: switchOn, //required
      activeColor: trsftcolor,
      inactiveColor: Colors.white,
      switchBorder: Border.all(
        color: trsftcolor,
        width: 2.0,
      ),
      toggleSize: 70,
      toggleBorder: Border.all(
          // color: trsftcolor,
          // width: 20.0,
          ),
      toggleColor: trsftcolor,
      activeToggleColor: trsftcolor,
      inactiveToggleColor: Colors.white,
      activeTextColor: Colors.white,
      inactiveTextColor: trsftcolor,
      activeText: "code marchand",
      inactiveText: "QR code",
      valueFontSize: 16.0,
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.05,
      borderRadius: 30.0,
      showOnOff: true,
      //required
      onToggle: (value) {
        setState(() {
          switchOn = value;
        });
      },
    );
  }
}
