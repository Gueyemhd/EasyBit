import 'package:easybit/screens/widgets/BuyAndSell.dart/BtcValue.dart';
import 'package:easybit/screens/widgets/BuyAndSell.dart/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell.dart/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell.dart/moneyField.dart';
import 'package:easybit/screens/widgets/BuyAndSell.dart/numberField.dart';
import 'package:flutter/material.dart';

class Orange extends StatefulWidget {
  const Orange({super.key});

  @override
  State<Orange> createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
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
            style: TextStyle(color: Color.fromRGBO(255, 102, 0, 1)),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
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
                const BtcValue(),
                const margin(),
                NumberField(
                    controler: telephoneController, couleur: Colors.grey[200]),
                const margin(),
                const margin(),
                ButtonTransaction(
                    press: () {},
                    couleur: const Color.fromRGBO(255, 102, 0, 1),
                    texte: "ACHETER")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
