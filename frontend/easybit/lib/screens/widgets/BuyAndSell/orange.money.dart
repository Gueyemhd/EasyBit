import 'package:easybit/screens/widgets/BuyAndSell/BtcValue.dart';
import 'package:easybit/screens/widgets/BuyAndSell/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell/moneyField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/numberField.dart';
import 'package:easybit/services/user_service.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Orange extends StatefulWidget {
  const Orange({super.key});

  @override
  State<Orange> createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
  String valeur = '';
  String dropdownValue = "BTC";

  final _formKey = GlobalKey<FormState>();

  final xofValueController = TextEditingController();
  final telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Achat BTC avec Orange Money",
            style: TextStyle(color: orange),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: const BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height / 12, 0, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  moneyField(controler: xofValueController),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height / 13,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 35, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.currency_exchange,
                                color: orange, size: 50.0),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                double value =
                                    double.parse(xofValueController.text);
                                print("=========Valeur=========");
                                print(value);
                                Map response =
                                    await UserService().calculatorbtc(value);
                                print("=========response=======");
                                print(response);
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
                  //const margin(),
                  BtcValue(
                    valeur: valeur,
                  ),
                  const margin(),
                  NumberField(
                      controler: telephoneController,
                      couleur: Colors.grey[200]),
                  const margin(),
                  const margin(),
                  ButtonTransaction(
                      press: () {}, couleur: orange, texte: "ACHETER")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
