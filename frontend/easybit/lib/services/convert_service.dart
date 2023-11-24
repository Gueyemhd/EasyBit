import 'dart:convert';

import 'package:easybit/models/user_model.dart';
import 'package:http/http.dart' as http;

class ConvertService {
  Future<Map> convertBTCtoXOF(Convert convert) async {
    try {
      String urlconvertBTCtoXOF = "http://127.0.0.1/Convert_XOF";

      http.Response response = await http.post(
        Uri.parse(urlconvertBTCtoXOF),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "coin_amount": convert.coin_amount,
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

  Future<Map> convertXOFtoBTC(Convert convert) async {
    try {
      String urlconvertXOFtoBTC = 'http://127.0.0.1/Convert_BTC';
      http.Response response = await http.post(
        Uri.parse(urlconvertXOFtoBTC),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "currency_amount": convert.currency_amount,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return {'error_message': "Un problème est survenu, veuillez réessayer!"};
    }
  }
}
