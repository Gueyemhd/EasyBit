import 'package:easybit/screens/widgets/welcome/footer.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 14,
              MediaQuery.of(context).size.height / 20,
              MediaQuery.of(context).size.width / 14,
              0),
          // padding: EdgeInsets.symmetric(
          //     horizontal: MediaQuery.of(context).size.width / 10),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("images/profil.png"),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'mouhamed01',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            const Text(
              'mouhamg@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
            const Divider(
              thickness: 0.8,
              color: Color.fromRGBO(23, 101, 152, 1),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ProfileMenu(
              title: "Notifications",
              icon: Icons.notifications,
              onPress: () {},
              textColor: Colors.black,
            ),
            ProfileMenu(
              title: "Changer mon mot de passe",
              icon: Icons.password,
              onPress: () {},
              textColor: Colors.black,
            ),
            ProfileMenu(
              title: "FAQs",
              icon: Icons.question_mark,
              onPress: () {},
              textColor: Colors.black,
            ),
            ProfileMenu(
              title: "A propos de nous",
              icon: Icons.people,
              onPress: () {},
              textColor: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            ProfileMenu(
              title: "Deconnexion",
              icon: Icons.logout,
              onPress: () {},
              endIcon: false,
              textColor: Color.fromARGB(255, 241, 62, 49),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const Footer(),
    ));
  }
}

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;
  final bool endIcon;
  final Color? textColor;

  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[200]),
        child: Icon(
          icon,
          color: const Color.fromRGBO(23, 101, 152, 1),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[200]),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(23, 101, 152, 1),
              ),
            )
          : null,
    );
  }
}
