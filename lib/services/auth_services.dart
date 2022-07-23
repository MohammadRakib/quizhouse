import 'package:quizhouse/dataSource/datasource.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
class AuthServices{

  static final AuthServices _authServices = AuthServices._();
  AuthServices._();
  factory AuthServices(){
    return _authServices;
  }

  //register
 Future<bool> register(UserModel userModel) async{
   final db = await Datasource().database;

   //check if email already exist
   bool userExist = await checkIfUserexist(db, userModel.email);
   if(!userExist){
     final bytes = utf8.encode(userModel.password);
     userModel.password = sha1.convert(bytes).toString();

     await db.insert('users', userModel.toMap());
     return true;

   }else{
     return false;
   }
}

  Future<bool> checkIfUserexist(Database db, String email) async{
    String sqluser = 'users WHERE email = \'$email\'';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);
    return maps.isNotEmpty? true:false;
  }

  //get current user
  Future<UserModel?> getCurrentUser() async{
    final db = await Datasource().database;
    String sqluser = 'users WHERE loginStatus = 1';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);
    if(maps.isNotEmpty){
      final userList = List.generate(maps.length, (i) {
        return UserModel(
            name: maps[i]['name'],
            email: maps[i]['email'],
            password: maps[i]['password'],
            loginStatus: maps[i]['loginStatus'] == 1? true:false,
            exp: maps[i]['exp'],
            lvl: maps[i]['lvl'],
            coin: maps[i]['coin'],
            gems: maps[i]['gems'],
        );
      });
      return userList[0];
    }
    return null;
  }

  Future updateUserLoginStatus(Database db,UserModel user) async{

    UserModel updatedUser = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
        loginStatus: !user.loginStatus,
        exp: user.exp,
        lvl: user.lvl,
        coin: user.coin,
        gems: user.gems,
    );

    await db.update('users', updatedUser.toMap(),
      where: 'email = ?',
      whereArgs: [user.email],
    );
  }

  //logout
  Future<bool> logout() async{
    final db = await Datasource().database;
    UserModel? user = await getCurrentUser();
    if(user != null){
      updateUserLoginStatus(db, user);
      return true;
    }
    return false;
  }

  Future<UserModel?> searchUser(Database db, String email) async{
    String sqluser = 'users WHERE email = \'$email\'';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);

    if(maps.isNotEmpty){
      final userList = List.generate(maps.length, (i) {
        return UserModel(
          name: maps[i]['name'],
          email: maps[i]['email'],
          password: maps[i]['password'],
          loginStatus: maps[i]['loginStatus'] == 1? true:false,
          exp: maps[i]['exp'],
          lvl: maps[i]['lvl'],
          coin: maps[i]['coin'],
          gems: maps[i]['gems'],
        );
      });
      return userList[0];
    }
    return null;
  }

// Login
  Future<bool> login(String email, String password) async{
    final db = await Datasource().database;

    //search user in the database
    UserModel? existUser = await searchUser(db, email);

    if(existUser != null){
      final bytes = utf8.encode(password);
      final encryptedPassword = sha1.convert(bytes);
      if(existUser.password == encryptedPassword.toString()){
        updateUserLoginStatus(db, existUser);
        return true;

      }else{
        return false;
      }
    }
    return false;
  }

}