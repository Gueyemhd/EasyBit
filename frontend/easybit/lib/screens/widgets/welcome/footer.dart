import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      color: Color.fromRGBO(23, 101, 152, 1),
      items: [
        Icon(
          Icons.home,
          color: Colors.white,
          size: 35.0,
        ),
        Icon(
          Icons.history,
          color: Colors.white,
          size: 35.0,
        ),
        Icon(
          Icons.calculate,
          color: Colors.white,
          size: 35.0,
        ),
        Icon(
          Icons.person,
          color: Colors.white,
          size: 35.0,
        )
      ],
    );
  }
}
