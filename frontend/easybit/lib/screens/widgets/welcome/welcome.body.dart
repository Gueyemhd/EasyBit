import 'package:flutter/material.dart';
import 'package:easybit/screens/widgets/welcome/actions.dart';
import 'package:easybit/screens/widgets/welcome/header.dart';
import 'package:easybit/screens/widgets/welcome/evolution.dart';
import 'package:easybit/screens/widgets/welcome/navigation.dart';
import 'package:localstorage/localstorage.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  LocalStorage storage = LocalStorage('user_information');
  bool isVisible = false;
  String defaultValue = "----------";
  String solde = "";
  String afficher = "----------";

  @override
  Widget build(BuildContext context) {
    Widget soldeSection() {
      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(23, 101, 152, 1),
                borderRadius: BorderRadius.all(Radius.circular(17.0))),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 7.5,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "+ 2.70% Aujourd'hui",
                          style: TextStyle(
                              color: Color.fromRGBO(235, 155, 216, 1),
                              fontSize: 17.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            '₿ $afficher',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
                Image.asset("images/bitcoin.png"),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4.8,
            width: MediaQuery.of(context).size.width / 5,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: MediaQuery.of(context).size.width / 7.5,
                width: MediaQuery.of(context).size.width / 7.5,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(160, 32, 130, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                child: IconButton(
                    onPressed: () => setState(() {
                          isVisible = !isVisible;
                          if (isVisible) {
                            afficher = '${storage.getItem('solde')}';
                          } else {
                            afficher = defaultValue;
                          }
                        }),
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    )),
              )
            ]),
          )
        ],
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 25.0,
            ),
            const Header(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 24.0,
            ),
            soldeSection(),
            const SizedBox(
              height: 20.0,
            ),
            const Operations(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40.0,
            ),
            const Evolution(),
          ]),
        ),
      ),
    );
  }
}
