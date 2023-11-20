import 'package:flutter/material.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salut Mouhamed",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 195, 69, 218),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.0),
              Text(
                "Bienvenue!",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: const Icon(
                IconData(0xf237, fontFamily: 'MaterialIcons'),
              ),
            ),
          )
        ],
      );
    }

    Widget soldeSection() {
      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            decoration: BoxDecoration(
                color: Color.fromRGBO(23, 101, 152, 1),
                borderRadius: BorderRadius.all(Radius.circular(17.0))),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("images/bitcoin.png"),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 25.0,
              ),
              header(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17.0,
              ),
              soldeSection(),
            ]),
          ),
        ),
      ),
    );
  }
}
