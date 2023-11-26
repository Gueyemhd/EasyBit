import 'package:easybit/screens/pages/welcomePage.dart';
import 'package:easybit/screens/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      letIndexChange: (value) => true,
      index: index,
      onTap: (selectedIndex) {
        setState(() {
          index = selectedIndex;
        });
      },
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      color: Color.fromRGBO(23, 101, 152, 1),
      items: const [
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
