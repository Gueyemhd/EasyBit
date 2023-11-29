import 'package:easybit/screens/widgets/BuyAndSell/actionTransaction.dart';
import 'package:easybit/screens/widgets/BuyAndSell/btcField.dart';
import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/screens/widgets/BuyAndSell/moneyValue.dart';
import 'package:easybit/screens/widgets/BuyAndSell/numberField.dart';
import 'package:flutter/material.dart';

enum Operators { om, wave }

class SellBitcoin extends StatefulWidget {
  const SellBitcoin({super.key});

  @override
  State<SellBitcoin> createState() => _SellBitcoinState();
}

class _SellBitcoinState extends State<SellBitcoin> {
  Operators? option = Operators.om;
  final _formKey = GlobalKey<FormState>();

  final btcValueController = TextEditingController();
  final telephoneController = TextEditingController();
  SellInformation data = new SellInformation();
  //data.btc = btcValueController.text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Vendre des bitcoins",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(23, 101, 152, 1),
          leading: const BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height / 17, 0, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  BtcField(controler: btcValueController),
                  const margin(),
                  const MoneyValue(),
                  const margin(),
                  NumberField(
                      controler: telephoneController,
                      couleur: const Color.fromRGBO(224, 233, 239, 1)),
                  const margin(),
                  const Center(
                      child: Text(
                    'Je reçois avec:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ListTile(
                          title: const Text('Orange money'),
                          leading: Radio<Operators>(
                            value: Operators.om,
                            groupValue: option,
                            onChanged: (Operators? value) {
                              setState(() {
                                option = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ListTile(
                          title: const Text('Wave'),
                          leading: Radio<Operators>(
                            value: Operators.wave,
                            groupValue: option,
                            onChanged: (Operators? value) {
                              setState(() {
                                option = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const margin(),
                  ButtonTransaction(
                    press: 
                    () async {
                          if (_formKey.currentState!.validate()) {
                            double.parse(btcValueController.text)
                            double.parse(telephoneController.text);
                            data.operateur = option;
                            Map response = 
                            await SellBtcService().SellValidation(data);
                            setState(() {
                             });
      
                        },
                      // SellInformation data = new SellInformation();

                      // data.montant_btc = btcValueController.text;
                      // data.montant_xof = telephoneController.text;
                      // data.operateur = option;
                      // final result = SellValidation(data);
                      // print (result);                    
                      },
                    couleur: const Color.fromRGBO(23, 101, 152, 1),
                    texte: "VENDRE",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
