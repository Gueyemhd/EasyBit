import 'package:easybit/constants.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool isRememberMe = false;

  Widget rememberMe() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      height: 20,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: gold),
          child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.white,
              activeColor: gold,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              }),
        ),
        const Text(
          'Se souvenir',
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    Widget manageUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: size.width * 0.7,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                border: Border.all(color: bluelogo, width: 3)),
            height: 50,
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.person, color: bluelogo),
                  hintText: 'Nom d\'utilisateur',
                  hintStyle: TextStyle(color: bluelogo, fontSize: 12)),
            ),
          )
        ],
      );
    }

    Widget managePassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: size.width * 0.7,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: bluelogo, width: 3)),
            height: 50,
            child: const TextField(
              //  keyboardType: TextInputType.emailAddress,
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: bluelogo),
                hintText: 'Mot de passe',
                hintStyle: TextStyle(
                  color: bluelogo,
                  fontSize: 12,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: bluelogo,
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      );
    }

    Widget manageForgotPasswordBtn() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        width: size.width * 0.7,
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () => print("Forgot password pressed"),
          child: const Text(
            'Mot de passe oublié?',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      );
    }

    Widget manageLoginBtn() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.6,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
              decoration: BoxDecoration(
                  color: bluelogo, //container color
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: gold, width: 2)),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        ),
      );
    }

    return Center(
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -190,
                left: -200,
                child: Container(
                  height: MediaQuery.of(context).size.height * 2,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, bluelogo],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: bluelogo,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("images/background.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, bluelogo],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 25,
                child: Container(
                  height: 200,
                  width: 200,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 70,
                bottom: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 14),
                    manageUsername(),
                    managePassword(),
                    manageForgotPasswordBtn(),
                    rememberMe(),
                    manageLoginBtn(),
                    checkSignInBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget checkSignInBtn() {
  return GestureDetector(
    onTap: () => print("Sign in pressed"),
    child: RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "N'avez vous pas encore de compte?",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: "  S'inscrire",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}
