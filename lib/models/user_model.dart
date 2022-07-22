class UserModel{
  String email;
  String password;
  bool loginStatus;
  dynamic exp;
  dynamic lvl;
  dynamic coin;
  dynamic gems;

  UserModel({required this.email, required this.password, required this.loginStatus, required this.exp, required this.lvl,
            required this.coin, required this.gems});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'loginStatus': loginStatus? 1 : 0,
      'exp': exp,
      'lvl': lvl,
      'coin': coin,
      'gems': gems,
    };
  }

  @override
  String toString() {
    return 'UserModel{email: $email, password: $password, loginStatus: $loginStatus, exp: $exp, lvl: $lvl, coin: $coin, gems: $gems}';
  }
}