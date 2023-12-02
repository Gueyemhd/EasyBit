import 'dart:convert';

import 'package:easybit/models/BuyBtc_Model.dart';
import 'package:easybit/models/SellBtc_Model.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

LocalStorage storage = LocalStorage('user_information');
String token = storage.getItem('token');

class SellBtcService {
  Future<Map> SellValidation(SellInformation data) async {
    try {
      String urlSale = "http://10.0.2.2:8000/vente_bitcoin/";

      http.Response response = await http.post(
        Uri.parse(urlSale),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
        body: json.encode({
          "montant_btc": data.montant_btc,
          "num_tel": data.num_tel,
          "operateur": data.operateur,
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

  Future<Map> BuyValidation(BuyInformation data) async {
    try {
      String urlSale = "http://10.0.2.2:8000/achat_bitcoin/";

      http.Response response = await http.post(
        Uri.parse(urlSale),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
        body: json.encode({
          "montant_xof": data.montant_xof,
          "montant_btc": data.montant_btc,
          "num_tel": data.num_tel,
          "operateur": data.operateur,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      print("=====erreur=====");
      print(e);
      return {
        'error_message': "Un problème est survenu, veuillez réessayer!",
        'error': true
      };
    }
  }

  Future<Map> getBalance() async {
    try {
      String urlSale = "http://10.0.2.2:8000/balance/";

      http.Response response = await http.get(
        Uri.parse(urlSale),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
      );

      return json.decode(response.body);
    } catch (e) {
      print("=====erreur=====");
      print(e);
      return {
        'error_message': "Un problème est survenu, veuillez réessayer!",
        'error': true
      };
    }
  }
}
