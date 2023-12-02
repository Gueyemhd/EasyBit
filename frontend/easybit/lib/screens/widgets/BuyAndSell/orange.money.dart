import 'package:easybit/models/BuyBtc_Model.dart';
import 'package:easybit/screens/widgets/BuyAndSell/BtcValue.dart';
import 'package:easybit/screens/widgets/BuyAndSell/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell/moneyField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/numberField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/purchaseMessage.dart';
import 'package:easybit/services/SellBtc_service.dart';
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

  BuyInformation data = BuyInformation();

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
                  NumberField(
                      controler: telephoneController,
                      couleur: Colors.grey[200]),
                  const margin(),
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
                                Map response =
                                    await UserService().calculatorbtc(value);

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
                  const margin(),
                  ButtonTransaction(
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          double value = double.parse(xofValueController.text);
                          Map response1 =
                              await UserService().calculatorbtc(value);
                          data.montant_xof = xofValueController.text;
                          data.num_tel = telephoneController.text;
                          String operator = "orange_money";
                          data.operateur = operator;
                          data.montant_btc = response1['price'].toString();
                          Map response =
                              await SellBtcService().BuyValidation(data);
                          // print("===========response=============");
                          // print(response);

                          if (response['message'] == "succes") {
                            xofValueController.clear;
                            telephoneController.clear;
                            setState(() {
                              valeur = '';
                            });

                            // ignore: use_build_context_synchronously
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return PurchaseSuccess(
                                    montantBtc: response['montant_btc'],
                                    montantXof: response['montant_xof'],
                                    date: response['date'],
                                    reference: response['reference'],
                                  );
                                });
                          }
                        }
                      },
                      // {
                      //   {
                      //     if (_formKey.currentState!.validate()) {
                      //       double value =
                      //           double.parse(xofValueController.text);
                      //       Map response1 =
                      //           await UserService().calculatorbtc(value);
                      //       data.montant_xof = xofValueController.text;
                      //       data.num_tel = telephoneController.text;
                      //       String operator = "orange_money";
                      //       data.operateur = operator;
                      //       data.montant_btc = response1['price'].toString();
                      //       Map response =
                      //           await SellBtcService().BuyValidation(data);
                      //       // print("===========response=============");
                      //       // print(response);
                      //       if (response['message'] == "succes") {
                      //         // ignore: use_build_context_synchronously

                      //         // ScaffoldMessenger.of(context).showSnackBar(
                      //         //   const SnackBar(
                      //         //       duration: Duration(seconds: 2),
                      //         //       backgroundColor:
                      //         //           Color.fromARGB(255, 243, 235, 235),
                      //         //       content: Text(
                      //         //         style: TextStyle(
                      //         //             color: orange,
                      //         //             fontSize: 18.0,
                      //         //             fontWeight: FontWeight.w500),
                      //         //         "Achat effectué avec succès",
                      //         //       )),
                      //         // );
                      //         // Navigator.of(context).push(MaterialPageRoute(
                      //         //     builder: (context) => const WelcomePage()));
                      //       }
                      //     }
                      //   }
                      // },
                      couleur: orange,
                      texte: "ACHETER")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
