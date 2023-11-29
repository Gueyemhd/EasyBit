class SellInformation {

  String? montant_btc;
  String? operateur;
  String? num_tel;


  SellInformation(
      {
      this.montant_btc,
      this.operateur,
      this.num_tel,
});
}

class SellConfirmation {

  String? username;
  String? password;

  SellConfirmation({this.username, this.password});
}
