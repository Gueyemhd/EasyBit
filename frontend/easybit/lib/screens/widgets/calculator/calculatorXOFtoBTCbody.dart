import 'package:easybit/screens/pages/calculatorBTCtoXOF.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class XOFtoBTC extends StatefulWidget {
  const XOFtoBTC({super.key});

  @override
  State<XOFtoBTC> createState() => _XOFtoBTCState();
}

class _XOFtoBTCState extends State<XOFtoBTC> {
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
              height: size.width * 0.15,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2)),
              child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    suffix: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      width: size.width * 0.18,
                      height: size.height * 0.20,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 193, 215, 236),
                        boxShadow: [
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
                        // Initial Values
                        value: dropdownvalue,
                        dropdownColor: bluelogo,

                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(237, 12, 90, 154),
                          size: 25,
                        ),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(color: Colors.white),
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
                  )),
            ),
          ]);
    }

    Widget xofField() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.9,
                height: size.width * 0.15,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12, width: 2)),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    suffix: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 18),
                      width: size.width * 0.15,
                      height: size.height * 0.03,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 213, 225, 236),
                        boxShadow: [
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
                      ),
                    ),
                    suffixStyle: const TextStyle(
                      fontSize: 20,
                      color: bluelogo,
                      backgroundColor: Color.fromARGB(255, 213, 225, 236),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 14),
                    hintStyle: const TextStyle(color: bluelogo, fontSize: 15),
                  ),
                )),
          ]);
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            xofField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            IconButton(
              iconSize: 70,
              icon: const Icon(
                Icons.change_circle,
                color: Color.fromARGB(237, 12, 90, 154),
              ),
              tooltip: 'Switcher les champs',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CalculatorBTCtoXOF())),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            btcField(),
          ]),
    );
  }
}
