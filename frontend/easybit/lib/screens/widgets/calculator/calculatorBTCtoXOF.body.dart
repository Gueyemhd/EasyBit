import 'package:easybit/screens/pages/calculatorXOFtoBTC.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BTCtoXOF extends StatefulWidget {
  const BTCtoXOF({super.key});

  @override
  State<BTCtoXOF> createState() => _BTCtoXOFState();
}

class _BTCtoXOFState extends State<BTCtoXOF> {
// Initial Selected Value
  String dropdownvalue = '  BTC';

  // List of items in our dropdown menu
  var items = [
    '  BTC',
    '  SAT',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    Widget btcField() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 221, 221),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: bluelogo, blurRadius: 6, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autofocus:
                          true, //make phone keyboard appear automatically
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Container(
                    width: size.width * 0.18,
                    height: size.width * 0.07,
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(177, 165, 183, 199),
                    ),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      dropdownColor: bluelogo,
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(237, 12, 90, 154),
                        size: 25,
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
            ))
      ]);
    }

    Widget xofField() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 221, 221),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: bluelogo, blurRadius: 6, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autofocus:
                          true, //make phone keyboard appear automatically
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Container(
                    width: size.width * 0.12,
                    height: size.width * 0.07,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(177, 165, 183, 199),
                        border: Border.all(color: Colors.black12, width: 2)),
                    child: const Text(
                      "CFA",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: bluelogo),
                    ),
                  ),
                ),
              ],
            ))
      ]);
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "1 BTC = 3,898,529,37 XOF",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(232, 20, 108, 180),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            btcField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CalculatorXOFtoBTC())),
              child: const Image(
                image: AssetImage("images/arrow_swap.png"),
                fit: BoxFit.cover,
                width: 60,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            xofField(),
          ]),
    );
  }
}
