import 'package:easybit/models/user_model.dart';
import 'package:easybit/screens/pages/transfertBitoins.dart';
import 'package:easybit/services/convert_service.dart';
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
  bool swapTextformfield = false;

  final _formKey = GlobalKey<FormState>();

  final btcController = TextEditingController();
  final xofController = TextEditingController();

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
                    controller: btcController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
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
            margin: const EdgeInsets.symmetric(vertical: 10),
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
                    controller: xofController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
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
          const Text(
            'Switcher',
            style: TextStyle(
                color: bluelogo, fontSize: 18, fontWeight: FontWeight.bold),
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
                color: bluelogo, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(
              Icons.currency_exchange,
              color: bluelogo,
              size: 38,
            ),
            tooltip: 'Convertir',
            onPressed: () async {
              TextEditingValue coin_amount;
              Convert convert = Convert(
                (coin_amount = btcController.value) as String,
              );
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar.
                Map response = await ConvertService().convertBTCtoXOF(convert);
                if (response['error'] == false) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TransfertBitcoins()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          style: const TextStyle(
                              color: Colors.red, fontSize: 15.0),
                          "${response['error_message']}",
                        )),
                  );
                }
              }
            },
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
            ]),
      ),
    );
  }
}
