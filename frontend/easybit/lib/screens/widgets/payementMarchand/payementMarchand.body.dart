import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:easybit/screens/widgets/payementMarchand/btcAmountBloc.dart';
import 'package:easybit/screens/widgets/payementMarchand/codeMarchandBloc.dart';
import 'package:easybit/screens/widgets/payementMarchand/roundedBtn.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class PayementMarchandBody extends StatefulWidget {
  const PayementMarchandBody({super.key});

  @override
  State<PayementMarchandBody> createState() => _PayementMarchandBodyState();
}

class _PayementMarchandBodyState extends State<PayementMarchandBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20),
      child: Column(children: <Widget>[
        const CodeMarchandBloc(),
        const BtcAmountField(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        RoundedBtn(
            text: "Payer",
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
            fillcolor: trsftcolor),
      ]),
    );
  }
}
