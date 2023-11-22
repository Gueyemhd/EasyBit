import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class TransfertBitcoinsBody extends StatefulWidget {
  const TransfertBitcoinsBody({super.key});

  @override
  State<TransfertBitcoinsBody> createState() => _TransfertBitcoinsBodyState();
}

class _TransfertBitcoinsBodyState extends State<TransfertBitcoinsBody> {
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

    Widget recipientUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Nom d\'utilisateur du beneficiaire',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                border: Border.all(color: bluelogo, width: 2)),
            height: 60,
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  hintText: 'Nom & prénom',
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 12)),
            ),
          )
        ],
      );
    }

    Widget btcAmount() {
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
                  autofocus: true, //make phone keyboard appear automatically
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: bluelogo, width: 2.0),
                    ),
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
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: bluelogo, width: 2.0),
                    ),
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
                        // style: TextStyle(fontSize: 20, color: bluelogo),
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        recipientUsername(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        btcAmount(),
      ]),
    );
  }
}
