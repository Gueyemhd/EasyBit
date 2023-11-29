import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['BTC', 'SAT'];

class CalculatorBtcValue extends StatefulWidget {
  final String valeur;
  const CalculatorBtcValue({super.key, required this.valeur});

  @override
  State<CalculatorBtcValue> createState() => _CalculatorBtcValueState();
}

class _CalculatorBtcValueState extends State<CalculatorBtcValue> {
  String? dropdownValue = 'BTC';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: containerTexfieldColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.valeur,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 20,
                    style: const TextStyle(
                        color: linearColor, fontWeight: FontWeight.w500),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
