import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/background.png"), fit: BoxFit.cover),
      ),
      child: Center(
          child: FlutterLogo(
        size: 200,
      )),
    );
  }
}

 /*DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ]),
        ),
        child: const Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/logo.png"),
              radius: 50,
            ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            Image(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
              // width: 500,
            ),
          ],
        ));*/

/*
decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/restaurantlogo.png"),
              radius: 30,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        )
*/
