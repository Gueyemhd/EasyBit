import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        height: size.height * 1,
        width: size.width * 1,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ],
          //border: Border.all(color: Colors.blue, width: 3)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: FlutterLogo(
                size: 200,
              )),
            ),
          ],
        ));
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
