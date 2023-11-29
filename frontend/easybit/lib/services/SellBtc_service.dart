import 'dart:convert';

import 'package:easybit/models/SellBtc_Model.dart';
import 'package:http/http.dart' as http;

class SellBtcService {
  Future<Map> SellValidation (SellInformation data) async {
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
      return 
        'error_message': "Un problème est survenu, veuillez réessayer!",
       'error': true      
    }
  }
}

//   Future<Map> login(UserLogin user) async {
//     try {
//       String urlLogin = 'http://10.0.2.2:8000/login/';
//       http.Response response = await http.post(
//         Uri.parse(urlLogin),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: json.encode({
//           "username": user.username,
//           "password": user.password,
//         }),
//       );

//       return json.decode(response.body);
//     } catch (e) {
//       return {'error_message': "Un problème est survenu, veuillez réessayer"};
//     }
//   }

//   Future<Map> logout() async {
//     try {
//       String urlLogin = 'http://10.0.2.2:8000/logout/';
//       http.Response response = await http.get(
//         Uri.parse(urlLogin),
//         headers: {
//           "Content-Type": "application/json",
//         },
//       );

//       return json.decode(response.body);
//     } catch (e) {
//       return {'error_message': "Un problème est survenu, veuillez réessayer"};
//     }
//   }

//   Future<Map> calculatorbtc(dynamic value) async {
//     try {
//       String urlRegistration = "http://10.0.2.2:8000/Convert_BTC/";

//       http.Response response = await http.post(
//         Uri.parse(urlRegistration),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "currency": value,
//         }),
//       );

//       return json.decode(response.body);
//     } catch (e) {
//       return {
//         'error_message': "Un problème est survenu, veuillez réessayer!",
//         'error': true
//       };
//     }
//   }

//   Future<Map> calculatorxof(dynamic value) async {
//     try {
//       String urlRegistration = "http://10.0.2.2:8000/Convert_XOF/";

//       http.Response response = await http.post(
//         Uri.parse(urlRegistration),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "coin": value,
//         }),
//       );

//       return json.decode(response.body);
//     } catch (e) {
//       return {
//         'error_message': "Un problème est survenu, veuillez réessayer!",
//         'error': true
//       };
//     }
//   }
// }
