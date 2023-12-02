import 'package:easybit/screens/pages/buyBtcWave.dart';
import 'package:easybit/screens/pages/payementMarchand.dart';
import 'package:easybit/screens/pages/sellBtc.dart';
import 'package:easybit/screens/pages/transfertBitoins.dart';
import 'package:easybit/screens/widgets/BuyAndSell/orange.money.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class Operations extends StatelessWidget {
  const Operations({super.key});

  @override
  Widget build(BuildContext context) {
    Widget actions() {
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Actions',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    elevation: 0.0,
                    enableFeedback: false,
                  ),
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Je souhaite payer avec:'),
                          elevation: 10.0,
                          backgroundColor:
                              const Color.fromARGB(255, 250, 250, 250),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  elevation: 0.0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Wave()));
                              },
                              child: Image.asset("images/wave.png"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  elevation: 0.0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Orange()));
                              },
                              child: Image.asset("images/orange_money.png"),
                            )
                          ],
                        ),
                      ),
                  child: Image.asset("images/buy.png")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    elevation: 0.0,
                    enableFeedback: false,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SellBtc()));
                  },
                  child: Image.asset("images/sell.png")),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    elevation: 0.0,
                    enableFeedback: false,
                  ),
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          elevation: 10.0,
                          backgroundColor: alertTrsfcolor,
                          actions: <Widget>[
                            Row(children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: alertTrsfcolor,
                                    elevation: 0.0),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const TransfertBitcoins()));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      Image.asset("images/transfert.png"),
                                      const Text('Transfert simple',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black)),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: alertTrsfcolor,
                                      elevation: 0.0),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PayementMarchand()));
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            Image.asset(
                                                "images/payement_marchand.png"),
                                            const Text('Paiement Marchand',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                          ]))),
                            ])
                          ],
                        ),
                      ),
                  child: Image.asset("images/transfer.png")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    elevation: 0.0,
                    enableFeedback: false,
                  ),
                  onPressed: () {},
                  child: Image.asset("images/withdraw.png")),
            ],
          ),
        )
      ]);
    }

    return actions();
  }
}
