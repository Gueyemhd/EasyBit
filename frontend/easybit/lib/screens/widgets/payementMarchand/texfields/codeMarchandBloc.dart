import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeMarchandBloc extends StatefulWidget {
  const CodeMarchandBloc({super.key});

  @override
  State<CodeMarchandBloc> createState() => _CodeMarchandState();
}

class _CodeMarchandState extends State<CodeMarchandBloc> {
  //final _formKey = GlobalKey<FormState>();
  final codeValue1Controller = TextEditingController();
  final codeValue2Controller = TextEditingController();
  final codeValue3Controller = TextEditingController();
  final codeValue4Controller = TextEditingController();
  final codeValue5Controller = TextEditingController();
  final codeValue6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Code marchand',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '4',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '3',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '2',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '7',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '9',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.01),
                      width: MediaQuery.of(context).size.width * 0.09,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: codeFieldcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Column(
                        children: [
                          TextFormField(
                            showCursor: false,
                            controller: codeValue1Controller,
                            // cursorColor: trsftcolor,
                            //   keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                              hintText: '4',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(132, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // The validator receives the text that the user has entered.
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'saisir code';
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
