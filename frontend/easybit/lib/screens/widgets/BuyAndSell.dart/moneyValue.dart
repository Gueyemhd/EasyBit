import 'package:flutter/material.dart';

class MoneyValue extends StatelessWidget {
  const MoneyValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(23, 101, 152, 1), width: 1.5),
              color: const Color.fromRGBO(224, 233, 239, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            height: 60,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                    child: Text(
                      'XOF',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
    ;
  }
}
