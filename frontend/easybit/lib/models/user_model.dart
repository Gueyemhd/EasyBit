import 'dart:ffi';

class Convert {
  String coinAmount; // bitcoin amount the user needs to type
  String price; //xof or btc amount to be displayed
  String currencyAmount; //cfa amount the user needs to type

  Convert(
      {required this.coinAmount,
      required this.price,
      required this.currencyAmount});

//convert the http.Response into a Dart object
  factory Convert.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'coin_amount': String coin_amount,
        'price': String price,
        'currency_amount': String currency_amount,
      } =>
        Convert(
          coinAmount: coin_amount,
          price: price,
          currencyAmount: currency_amount,
        ),
      _ => throw const FormatException('Failed to load convert.'),
    };
  }
}

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
  });
}
