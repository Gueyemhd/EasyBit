import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class DrawerHeader extends StatelessWidget {
  const DrawerHeader(
      {super.key, required BoxDecoration decoration, required Row child});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            bluelogo,
          ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/logo.png"),
              radius: 30,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ));
  }
}
