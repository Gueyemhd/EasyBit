import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransfertBitcoinsBody extends StatefulWidget {
  const TransfertBitcoinsBody({super.key});

  @override
  State<TransfertBitcoinsBody> createState() => _TransfertBitcoinsBodyState();
}

class _TransfertBitcoinsBodyState extends State<TransfertBitcoinsBody> {
  // Initial Selected Value
  String dropdownvalue = '  BTC';

  // List of items in our dropdown menu
  var items = [
    '  BTC',
    '  SAT',
  ];

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  Map userData = {};

  final recipientUsernameController = TextEditingController();
  final btcAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
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
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 221, 221),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: transfertcolor,
                      blurRadius: 6,
                      offset: Offset(5, 5))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: transfertcolor,
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
                  )
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
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 221, 221),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: transfertcolor,
                      blurRadius: 6,
                      offset: Offset(5, 5))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        cursorColor: transfertcolor,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        autofocus: true,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                          hintText: 'Entrer le montant à transférer',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(132, 0, 0, 0),
                              fontSize: 13),
                        )),
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
                        dropdownColor: transfertcolor,
                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: transfertcolor,
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
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.4,
        height: size.height * 0.05,
        child: ClipRRect(
          child: Container(
              decoration: BoxDecoration(
                color: disableTrsftButton,
                borderRadius: BorderRadius.circular(70),
              ),
              child: TextButton(
                /*  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return transfertcolor;
                    }
                    return disableTrsftButton;
                  }),
                ),*/
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Succès')),
                    );
                  }
                  /*
                  User user = User();
                  user.username = usernameController.text;
                  user.password = passwordController.text;

                  UserService().login(user);*/
                },
                child: const Text(
                  "Transférer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        ),
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
