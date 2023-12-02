import 'package:easybit/screens/widgets/BuyAndSell/margin.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class PurchaseSuccess extends StatelessWidget {
  final String montantXof;
  final String montantBtc;
  final String date;
  final String reference;

  const PurchaseSuccess(
      {super.key,
      required this.date,
      required this.montantBtc,
      required this.montantXof,
      required this.reference});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(172, 0, 0, 0),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 45,
                    color: Colors.green,
                  ),
                  Text(
                    'Achat effectué avec succès!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const margin(),
          ListTile(
            title: const Text(
              'Montant XOF',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            trailing: Text(
              '$montantXof Fcfa',
              style: const TextStyle(fontSize: 17, color: orange),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
            title: const Text(
              'Montant BTC',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            trailing: Text(
              '$montantBtc BTC',
              style: const TextStyle(fontSize: 17, color: orange),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
            title: const Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            trailing: Text(
              date.substring(0, 16),
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          ListTile(
            title: const Text(
              'Référence',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            trailing: Text(
              reference,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          //const margin(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: orange, elevation: 2),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fermer'))
        ],
      ),
    );
  }
}
