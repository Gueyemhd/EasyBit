import 'dart:convert';

import 'package:easybit/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

LocalStorage storage = LocalStorage('user_information');
String token = storage.getItem('token');

class UserService {
  Future<Map> registration(UserInformation user) async {
    try {
      String urlRegistration = "http://10.0.2.2:8000/register/";

      http.Response response = await http.post(
        Uri.parse(urlRegistration),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "prenom": user.prenom,
          "nom": user.nom,
          "username": user.username,
          "adresse_mail": user.adresseMail,
          "mot_de_passe": user.motDePasse,
          "confirmation": user.confirmation
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return {
        'error_message': "Un problème est survenu, veuillez réessayer!",
        'error': true
      };
    }
  }

  Future<Map> login(UserLogin user) async {
    try {
      String urlLogin = 'http://10.0.2.2:8000/login/';
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

      return json.decode(response.body);
    } catch (e) {
      return {'error_message': "Un problème est survenu, veuillez réessayer"};
    }
  }

  Future<Map> logout() async {
    try {
      String urlLogin = 'http://10.0.2.2:8000/logout/';
      http.Response response = await http.get(
        Uri.parse(urlLogin),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      return json.decode(response.body);
    } catch (e) {
      return {'error_message': "Un problème est survenu, veuillez réessayer"};
    }
  }

  Future<Map> calculatorbtc(dynamic value) async {
    try {
      String urlRegistration = "http://10.0.2.2:8000/Convert_BTC/";

      http.Response response = await http.post(
        Uri.parse(urlRegistration),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "currency": value,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return {
        'error_message': "Un problème est survenu, veuillez réessayer!",
        'error': true
      };
    }
  }

  Future<Map> calculatorxof(dynamic value) async {
    try {
      String urlRegistration = "http://10.0.2.2:8000/Convert_XOF/";

      http.Response response = await http.post(
        Uri.parse(urlRegistration),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "coin": value,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return {
        'error_message': "Un problème est survenu, veuillez réessayer!",
        'error': true
      };
    }
  }
}
