import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends StatelessWidget {
  final Color? couleur;
  final TextEditingController controler;
  const NumberField(
      {super.key, required this.controler, required this.couleur});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: couleur,
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
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: Text(
                  '+221',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controler,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String value) {},
                  style: const TextStyle(color: Colors.black87, fontSize: 16.0),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      hintText: 'téléphone',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
