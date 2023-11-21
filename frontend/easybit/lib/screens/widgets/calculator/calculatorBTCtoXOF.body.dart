import 'package:easybit/screens/pages/calculatorBTCtoXOF.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.9,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 2)),
            height: 60,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -190,
                  left: -150,
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(237, 12, 90, 154),
                        size: 45,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.24,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 225, 236),
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Colors.black12, width: 0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        )
                      ],
                    ),
                    child: DropdownButton(
                      style: const TextStyle(color: Colors.blue),
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 45,
                      //   iconDisabledColor: Colors.blue,
                      iconEnabledColor: Colors.grey,
                      //dropdownColor: Colors.blue,
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            //     selectionColor: Colors.blue,
                            style:
                                const TextStyle(fontSize: 20, color: bluelogo),
                          ),
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
            ),
          ),
        ],
      );
    }

    Widget xofField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.9,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 2)),
            height: 60,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -190,
                  left: -150,
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(237, 12, 90, 154),
                        size: 45,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.15,
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 213, 225, 236),
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Colors.black12, width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        )
                      ],
                    ),
                    child: const Text(
                      "CFA",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: bluelogo),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "1 BTC = 3,898,529,37 XOF",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(232, 20, 108, 180),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            btcField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            IconButton(
              iconSize: 70,
              icon: const Icon(
                Icons.change_circle,
                color: Color.fromARGB(237, 12, 90, 154),
              ),
              tooltip: 'switcher les champs',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CalculatorBTCtoXOF())),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            xofField(),
          ]),
    );
  }
}
