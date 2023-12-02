class BuyInformation {
  String? montant_xof;
  String? montant_btc;
  String? operateur;
  String? num_tel;

  BuyInformation(
      {this.montant_xof, this.operateur, this.num_tel, this.montant_btc});
}

class BuyConfirmation {
  String? username;
  String? password;

  BuyConfirmation({this.username, this.password});
}
