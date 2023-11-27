import 'package:easybit/screens/widgets/BuyAndSell/BtcValueWave.dart';
import 'package:easybit/screens/widgets/BuyAndSell/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell/moneyField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/numberField.dart';
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
          backgroundColor: const Color.fromRGBO(29, 200, 255, 1),
          leading: const BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height / 12, 0, 0),
            child: Column(
              children: [
                moneyField(controler: xofValueController),
                const margin(),
                const BtcValueWave(),
                const margin(),
                NumberField(
                    controler: telephoneController, couleur: Colors.grey[200]),
                const margin(),
                const margin(),
                ButtonTransaction(
                    press: () {},
                    couleur: const Color.fromRGBO(29, 200, 255, 1),
                    texte: "ACHETER")
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
