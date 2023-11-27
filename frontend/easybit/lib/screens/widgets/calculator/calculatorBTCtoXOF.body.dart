import 'dart:convert'; // this library allows to access to jsonEncode to encode the data

import 'package:easybit/models/user_model.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
  bool swapTextformfield = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController btcController = TextEditingController();
  final TextEditingController xofController = TextEditingController();
  Future<Convert>? _futureConvert; // _ means private variable
  Future<Convert>? _futureConvert1;

  FutureBuilder<Convert> buildFutureBuilder() {
    return FutureBuilder<Convert>(
      future: _futureConvert,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.price);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<Convert> buildFutureBuilder1() {
    return FutureBuilder<Convert>(
      future: _futureConvert1,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.price);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  late Future<Convert> futureConvert2;
  late Future<Convert> futureConvert3;

  @override
  void initState() {
    super.initState();
    futureConvert2 = fetchXofPrice();
    futureConvert3 = fetchBtcPrice();
  }

  FutureBuilder<Convert> buildFutureBuilder2() {
    return FutureBuilder<Convert>(
      future: futureConvert2,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.price);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<Convert> buildFutureBuilder3() {
    return FutureBuilder<Convert>(
      future: futureConvert3,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.price);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen

    Widget btcField() {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.01),
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
                    controller: btcController,
                    cursorColor: bluelogo,
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
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      buildFutureBuilder2();
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le montant en btc';
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
                      color: calculatorDropdownColor,
                    ),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      dropdownColor: bluelogo,
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: bluelogo,
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
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.01),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: containerTexfieldColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: bluelogo, blurRadius: 6, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: xofController,
                    cursorColor: bluelogo,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autofocus: true,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      buildFutureBuilder();
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le montant en xof';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Container(
                    width: size.width * 0.12,
                    height: size.width * 0.07,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: calculatorDropdownColor,
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

    Widget swapconvertBtn() {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
              children: [
                const Text(
                  'Switcher',
                  style: TextStyle(
                      color: bluelogo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      swapTextformfield = true;
                    });
                  },
                  child: const Image(
                    image: AssetImage("images/arrow_swap.png"),
                    fit: BoxFit.cover,
                    width: 60,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.13,
                ),
                const Text(
                  'Convertir',
                  style: TextStyle(
                      color: bluelogo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.currency_exchange,
                    color: bluelogo,
                    size: 38,
                  ),
                  tooltip: 'Convertir',
                  onPressed: () {
                    setState(() {
                      _futureConvert = convertBTCtoXOF(btcController.text);
                      //On pressing the convertir button
                      // make the network request,
                      // which sends the data in the TextField to the server as a POST request
                      _futureConvert1 = convertBTCtoXOF(xofController.text);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20),
      child: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              swapTextformfield ? xofField() : btcField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              swapconvertBtn(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              swapTextformfield ? btcField() : xofField(),
              Row(
                children: [
                  buildFutureBuilder(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  buildFutureBuilder2(),
                ],
              )
            ]),
      ),
    );
  }
}

//This method uses the http.post() method to send the encoded data to the server
//This method takes an argument coinAmount
// that is sent to the server to convert to the xof value
Future<Convert> convertBTCtoXOF(String coinAmount) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1/Convert_BTC'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'coin_amount': coinAmount,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Convert.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to send coin_amount to server.');
  }
}

Future<Convert> convertXOFtoBTC(String currencyAmount, String price) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1/Convert_XOF'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'currency_amount': currencyAmount,
    }),
  );

  if (response.statusCode == 201) {
    return Convert.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to send coin_amount to server.');
  }
}

Future<Convert> fetchXofPrice() async {
  final response = await http.get(Uri.parse('http://127.0.0.1/Convert_BTC'));

  if (response.statusCode == 200) {
    return Convert.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load convert');
  }
}

Future<Convert> fetchBtcPrice() async {
  final response = await http.get(Uri.parse('http://127.0.0.1/Convert_XOF'));

  if (response.statusCode == 200) {
    return Convert.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load convert');
  }
}
