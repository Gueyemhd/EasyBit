import 'package:easybit/screens/pages/navigationPage.dart';
import 'package:easybit/screens/widgets/payementMarchand/buttons/containerPayement.dart';
import 'package:easybit/screens/widgets/payementMarchand/buttons/qrcode.dart';
import 'package:easybit/screens/widgets/payementMarchand/texfields/btcAmountBloc.dart';
import 'package:easybit/screens/widgets/payementMarchand/texfields/codeMarchandBloc.dart';
import 'package:easybit/screens/widgets/payementMarchand/buttons/roundedBtn.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class PayementMarchandBody extends StatefulWidget {
  const PayementMarchandBody({super.key});

  @override
  State<PayementMarchandBody> createState() => _PayementMarchandBodyState();
}

class _PayementMarchandBodyState extends State<PayementMarchandBody> {
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20),
      child: Column(children: <Widget>[
        const ContainerMarchand(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        change ? const CodeMarchandBloc() : const Qrcode(),
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
