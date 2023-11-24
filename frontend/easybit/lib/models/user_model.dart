import 'dart:ffi';

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

class Convert {
  Float? coin_amount; // montant du bitcoin à entrer pour la conversion
  String? price; //montant en xof ou btc à afficher
  Float? currency_amount; //montant en cfa à fournir

  Convert(String s, {this.coin_amount, this.price, this.currency_amount});
}
