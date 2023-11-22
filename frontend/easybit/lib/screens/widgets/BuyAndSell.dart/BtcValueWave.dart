import 'package:flutter/material.dart';

const List<String> list = <String>['BTC', 'SAT'];

class BtcValueWave extends StatefulWidget {
  const BtcValueWave({super.key});

  @override
  State<BtcValueWave> createState() => _BtcValueWaveState();
}

class _BtcValueWaveState extends State<BtcValueWave> {
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
              border: Border.all(
                  color: const Color.fromRGBO(29, 200, 255, 1), width: 1.5),
              color: Colors.grey[200],
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
                  Text(''),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Color.fromRGBO(29, 200, 255, 1),
                        fontWeight: FontWeight.w500),
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
