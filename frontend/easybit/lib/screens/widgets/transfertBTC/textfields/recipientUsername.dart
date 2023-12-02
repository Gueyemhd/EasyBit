import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class RecipientUsername extends StatefulWidget {
  const RecipientUsername({super.key});

  @override
  State<RecipientUsername> createState() => _RecipientUsernameState();
}

class _RecipientUsernameState extends State<RecipientUsername> {
  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintText: 'Entrer le nom d\'utilisateur du bénéficiaire',
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
}
