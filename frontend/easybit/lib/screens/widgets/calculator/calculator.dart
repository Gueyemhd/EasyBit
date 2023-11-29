import 'package:easybit/screens/widgets/calculator/calculatorBtcField.dart';
import 'package:easybit/screens/widgets/calculator/calculatorBtcValue.dart';
import 'package:easybit/screens/widgets/calculator/calculatorXofField.dart';
import 'package:easybit/screens/widgets/calculator/calculatorXofValue.dart';
import 'package:easybit/services/user_service.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String dropdownValue = "BTC";
  bool swap = true;
  String valeur = '';

  final _formKey = GlobalKey<FormState>();

  final xofValueController = TextEditingController();
  final btcValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height / 12, 0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              swap
                  ? CalculatorBtcFields(
                      controler: btcValueController,
                    )
                  : CalculatorXofField(controler: xofValueController),
              //const margin(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height / 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 35, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.swap_vert_circle_rounded,
                            color: linearColor, size: 65.0),
                        onPressed: () {
                          setState(() {
                            swap = !swap;
                            valeur = '';
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.currency_exchange,
                            color: linearColor, size: 60.0),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            double value = swap
                                ? double.parse(btcValueController.text)
                                : double.parse(xofValueController.text);
                            Map response = swap
                                ? await UserService().calculatorxof(value)
                                : await UserService().calculatorbtc(value);
                            setState(() {
                              valeur = response['price'].toString();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // const margin(),
              swap
                  ? CalculatorXofValue(
                      valeur: valeur,
                    )
                  : CalculatorBtcValue(
                      valeur: valeur,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
