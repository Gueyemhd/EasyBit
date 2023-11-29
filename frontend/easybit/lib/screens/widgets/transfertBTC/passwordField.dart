import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      width: MediaQuery.of(context).size.width * 0.01,
      height: MediaQuery.of(context).size.height * 0.06,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: const Color.fromARGB(215, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: fiedeltcolor, width: 3)),
      child: TextFormField(
        cursorColor: trsftcolor,
        // The validator receives the password that the user has entered.
        // controller: passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '  Veuillez entrer votre mot de passe';
          }
          return null;
        },
        onChanged: (String value) {},
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 14),
          prefixIcon: const Icon(Icons.lock, color: fiedeltcolor),
          hintText: 'Mot de passe',
          hintStyle: const TextStyle(
            color: fiedeltcolor,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility_off : Icons.visibility,
              color: fiedeltcolor,
            ),
            onPressed: () {
              setState(
                () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
