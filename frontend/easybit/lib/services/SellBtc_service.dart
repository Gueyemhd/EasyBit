import 'dart:convert';

import 'package:easybit/models/SellBtc_Model.dart';
import 'package:http/http.dart' as http;

class SellBtcService {
  Future<Map> SellValidation(SellInformation data) async {
    try {
      String urlSale = "http://10.0.2.2:8000/vente_bitcoin/";

      http.Response response = await http.post(
        Uri.parse(urlSale),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
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
}
