import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> list = <String>['BTC', 'SAT'];

class BtcField extends StatefulWidget {
  final TextEditingController controler;
  const BtcField({super.key, required this.controler});

  @override
  State<BtcField> createState() => _BtcFieldState();
}

class _BtcFieldState extends State<BtcField> {
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
            color: const Color.fromRGBO(224, 233, 239, 1),
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {},
                  style: const TextStyle(color: Colors.black87, fontSize: 16.0),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintText: 'Entrez le montant à vendre',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 153, 151, 151),
                          fontSize: 14)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                child: DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 20,
                  style: const TextStyle(
                      color: Color.fromRGBO(23, 101, 152, 1),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
