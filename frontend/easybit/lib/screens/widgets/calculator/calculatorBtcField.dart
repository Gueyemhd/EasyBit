import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['BTC', 'SAT'];

class CalculatorBtcFields extends StatefulWidget {
  final TextEditingController controler;
  const CalculatorBtcFields({super.key, required this.controler});

  @override
  State<CalculatorBtcFields> createState() => _CalculatorBtcFieldsState();
}

class _CalculatorBtcFieldsState extends State<CalculatorBtcFields> {
  String? dropdownValue = 'BTC';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: containerTexfieldColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            //    border: Border.all(color: bluelogo, width: 3)
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  controller: widget.controler,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une valeur correcte';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {},
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 153, 151, 151),
                          fontSize: 14)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                child: DropdownButton(
                  dropdownColor: calculatorDropdownColor,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
