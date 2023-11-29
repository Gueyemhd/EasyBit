import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  LocalStorage storage = LocalStorage('user_information');
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salut ${storage.getItem('prenom')}",
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 195, 69, 218),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Bienvenue!",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
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

    return header();
  }
}
