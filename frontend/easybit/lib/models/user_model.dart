class UserInformation {
  String? prenom;
  String? nom;
  String? username;
  String? adresseMail;
  String? motDePasse;
  String? confirmation;
  UserInformation(
      {this.prenom,
      this.nom,
      this.username,
      this.adresseMail,
      this.motDePasse,
      this.confirmation});
}

class UserLogin {
  String? username;
  String? password;

  UserLogin({this.username, this.password});
}
