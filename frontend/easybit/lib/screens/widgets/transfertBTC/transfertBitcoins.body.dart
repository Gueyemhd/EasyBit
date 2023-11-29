import 'package:easybit/screens/widgets/transfertBTC/quitBtn.dart';
import 'package:easybit/screens/widgets/transfertBTC/rowpopup.dart';
import 'package:easybit/screens/widgets/transfertBTC/rowpopup2.dart';
import 'package:easybit/screens/widgets/transfertBTC/rowpopup3.dart';
import 'package:easybit/screens/widgets/transfertBTC/submitBtn.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransfertBitcoinsBody extends StatefulWidget {
  const TransfertBitcoinsBody({super.key});

  @override
  State<TransfertBitcoinsBody> createState() => _TransfertBitcoinsBodyState();
}

class _TransfertBitcoinsBodyState extends State<TransfertBitcoinsBody> {
  String dropdownvalue = '  BTC';
  var items = [
    '  BTC',
    '  SAT',
  ];

  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  Map userData = {};

  final recipientUsernameController = TextEditingController();
  final btcAmountController = TextEditingController();

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Je souhaite transférer'),
          content: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                //: horizontal: MediaQuery.of(context).size.width * 0.01
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(238, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: trsftcolor, blurRadius: 6, offset: Offset(5, 5))
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Rowpopup(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Rowpopup2(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Rowpopup3()
                ],
              )),
          actions: const <Widget>[
            Quit(),
            SubmitBtn(),
          ],
        );
      },
    );
  }

  Widget recipientUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nom d\'utilisateur du bénéficiaire',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 221, 221),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: trsftcolor, blurRadius: 6, offset: Offset(5, 5))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: bluelogo,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintText: 'Entrer le nom d\'utilisateur du bénéficiaire',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(132, 0, 0, 0), fontSize: 13),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget recipientUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nom d\'utilisateur du bénéficiaire',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
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
                  BoxShadow(
                      color: trsftcolor, blurRadius: 6, offset: Offset(3, 3))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: trsftcolor,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                        hintText:
                            'Entrer le nom d\'utilisateur du bénéficiaire',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(132, 0, 0, 0), fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      );
    }

    Widget btcAmount() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Montant',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
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
                  BoxShadow(
                      color: trsftcolor, blurRadius: 6, offset: Offset(3, 3))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: btcAmountController,
                      cursorColor: trsftcolor,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autofocus:
                          true, //make phone keyboard appear automatically
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                        hintText: 'Entrer le montant à transférer',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(132, 0, 0, 0), fontSize: 13),
                      ),
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
                        color: transfertDropdownColor,
                      ),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        dropdownColor: trsftcolor,
                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: trsftcolor,
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
              )),
        ],
      );
    }

    Widget transfertBtn() {
      return ElevatedButton(
        onPressed: _showAlertDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: trsftcolor,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        child: const Text('Transférer'),
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20),
      child: Column(children: <Widget>[
        recipientUsername(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        btcAmount(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        transfertBtn()
      ]),
    );
  }
}
