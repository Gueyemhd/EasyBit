import 'package:easybit/screens/widgets/calculator/calculator.dart';
import 'package:easybit/screens/widgets/profile.dart';
import 'package:easybit/screens/widgets/welcome/welcome.body.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: SafeArea(
          child: Scaffold(
        appBar: index == 2
            ? AppBar(
                title: const Text(
                  "Calculateur",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: bluelogo,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
              )
            : null,
        body: selectedContent(index: index),
        bottomNavigationBar: index == 2
            ? null
            : CurvedNavigationBar(
                letIndexChange: (value) => true,
                index: index,
                onTap: (selectedIndex) {
                  setState(() {
                    index = selectedIndex;
                  });
                },
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                color: const Color.fromRGBO(23, 101, 152, 1),
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
              ),
      )),
    );
  }

  Widget selectedContent({required int index}) {
    Widget widget = const WelcomeBody();
    switch (index) {
      case 0:
        widget = const WelcomeBody();
        break;
      case 2:
        widget = const Calculator();
      case 3:
        widget = const ProfileUser();
        break;
    }
    return widget;
  }
}
