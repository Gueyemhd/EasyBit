import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BtcAmountField extends StatefulWidget {
  const BtcAmountField({super.key});

  @override
  State<BtcAmountField> createState() => _BtcAmountState();
}

class _BtcAmountState extends State<BtcAmountField> {
  String dropdownvalue = '  BTC';
  var items = [
    '  BTC',
    '  SAT',
  ];

  //final _formKey = GlobalKey<FormState>();
  final btcAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Montant',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: btcAmountController,
                    cursorColor: trsftcolor,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autofocus: true, //make phone keyboard appear automatically
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintText: 'Entrer le montant à payer',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(132, 0, 0, 0), fontSize: 13),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le montant à payer';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Container(
                    width: size.width * 0.18,
                    height: size.width * 0.07,
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      color: transfertDropdownColor,
                    ),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      dropdownColor: trsftcolor,
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: trsftcolor,
                        size: 25,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      // Array list of items
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}