import 'package:flutter/material.dart';

const List<String> list = <String>['BTC', 'SAT'];

class BtcValue extends StatefulWidget {
  final String valeur;
  const BtcValue({super.key, required this.valeur});

  @override
  State<BtcValue> createState() => _BtcValueState();
}

class _BtcValueState extends State<BtcValue> {
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
                  color: const Color.fromRGBO(255, 102, 0, 1), width: 1.5),
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
                  Text(widget.valeur),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 20,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 102, 0, 1),
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
