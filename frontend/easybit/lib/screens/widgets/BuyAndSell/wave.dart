import 'package:easybit/screens/widgets/BuyAndSell/BtcValueWave.dart';
import 'package:easybit/screens/widgets/BuyAndSell/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell/moneyField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/numberField.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class BuyBtcWave extends StatefulWidget {
  const BuyBtcWave({super.key});

  @override
  State<BuyBtcWave> createState() => _BuyBtcWaveState();
}

class _BuyBtcWaveState extends State<BuyBtcWave> {
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
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: waveColor,
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
                  const margin(),
                  const BtcValueWave(),
                  const margin(),
                  const margin(),
                  ButtonTransaction(
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          print("==================valeur====================");
                          String valeur = xofValueController.text;
                          print(valeur);
                        }
                      },
                      couleur: const Color.fromRGBO(29, 200, 255, 1),
                      texte: "ACHETER")
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
