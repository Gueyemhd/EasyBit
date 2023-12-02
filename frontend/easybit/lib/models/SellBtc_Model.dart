class SellInformation {
  String? montant_btc;
  String? montant_xof;
  String? operateur;
  String? num_tel;

  SellInformation(
      {this.montant_btc, this.operateur, this.num_tel, this.montant_xof});
}

class SellConfirmation {
  String? username;
  String? password;

  SellConfirmation({this.username, this.password});
}
