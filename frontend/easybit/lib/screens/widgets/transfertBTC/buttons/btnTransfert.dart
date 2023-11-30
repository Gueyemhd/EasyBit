import 'package:easybit/screens/widgets/transfertBTC/buttons/quitBtn.dart';
import 'package:easybit/screens/widgets/transfertBTC/popupRows/rowpopup.dart';
import 'package:easybit/screens/widgets/transfertBTC/popupRows/rowpopup2.dart';
import 'package:easybit/screens/widgets/transfertBTC/popupRows/rowpopup3.dart';
import 'package:easybit/screens/widgets/transfertBTC/buttons/submitBtn.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class TransfertBtn extends StatefulWidget {
  const TransfertBtn({super.key});

  @override
  State<TransfertBtn> createState() => _TransfertBtnState();
}

class _TransfertBtnState extends State<TransfertBtn> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      width: size.width * 0.5,
      height: size.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: Container(
            decoration: BoxDecoration(
              color: trsftcolor, //container color
              borderRadius: BorderRadius.circular(50),
            ),
            height: 70,
            child: TextButton(
              onPressed: () {
                _showAlertDialog();
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
}
