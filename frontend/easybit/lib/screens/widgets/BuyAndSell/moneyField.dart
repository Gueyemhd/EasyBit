import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class moneyField extends StatelessWidget {
  final TextEditingController controler;
  const moneyField({super.key, required this.controler});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            //    border: Border.all(color: bluelogo, width: 3)
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  controller: controler,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {},
                  style: const TextStyle(color: Colors.black87, fontSize: 16.0),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      hintText: 'Entrez le montant',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
              ),
              const Padding(
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
        ),
      ],
    );
  }
}
