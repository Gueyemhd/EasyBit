import 'package:easybit/screens/widgets/drawer/drawer.item.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Démarrage",
        "route": "/EasyBit",
        "leadingIcon": Icons.start,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Lancement",
        "route": "/launch",
        "leadingIcon": Icons.rocket_launch,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Créer un compte",
        "route": "/registration",
        "leadingIcon": Icons.person_add,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Se connecter",
        "route": "/login",
        "leadingIcon": Icons.login,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Accueil",
        "route": "/home",
        "leadingIcon": Icons.home,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Calculateur BTC-CFA",
        "route": "/CalculatorBTCtoXOF",
        "leadingIcon": Icons.currency_bitcoin,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Calculateur CFA-BTC",
        "route": "/CalculatorXOFtoBTC",
        "leadingIcon": Icons.currency_bitcoin,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Achat des bitcoins",
        "route": "/achet-bitcoins",
        "leadingIcon": Icons.currency_bitcoin,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Vente des bitcoins",
        "route": "/vente-bitcoins",
        "leadingIcon": Icons.currency_bitcoin,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Profil",
        "route": "/profile",
        "leadingIcon": Icons.manage_accounts,
        "trailingIcon": Icons.arrow_forward
      }
    ];
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return DrawerItem(
                      title: menus[index]['title'],
                      leadingIcon: menus[index]['leadingIcon'],
                      trailingIcon: menus[index]['trailingIcon'],
                      onAction: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, menus[index]['route']);
                      });
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                  );
                },
                itemCount: menus.length),
          ),
        ],
      ),
    );
  }
}
