import 'dart:convert';

import 'package:easybit/models/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<bool> registration(User user) async {
    try {
      String urlRegistration = 'http://10.0.2.2:8000/registration';
      http.Response response = await http.post(
        Uri.parse(urlRegistration),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "password": user.id,
          "first_name": user.firstname,
          "last_name": user.lastname,
          "username": user.username,
          "adresse_mail": user.email,
          "mot_de_passe": user.password,
          "confirmation": user.confirmPassword
        }),
      );
      var data = json.decode(response.body) as Map;
      print(data);
      return true;
    } catch (e) {
      print(e);

      return true;
    }
  }

  Future<bool> login(User user) async {
    try {
      String urlLogin = 'http://10.0.2.2:8000/login';
      http.Response response = await http.post(
        Uri.parse(urlLogin),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "username": user.username,
          "password": user.password,
        }),
      );
      var data = json.decode(response.body) as Map;
      print(data);

      return true;
    } catch (e) {
      print(e);

      return true;
    }
  }
}
