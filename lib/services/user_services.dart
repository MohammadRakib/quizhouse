import 'package:quizhouse/repository/db_repository.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:crypto/crypto.dart';
import 'package:quizhouse/repository/user_repository.dart';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
class UserServices{

  //register
 Future<bool> register(UserModel userModel) async{
    UserRepository userRepository = UserRepository();
   //check if email already exist
   bool userExist = await userRepository.checkIfUserExist(userModel.email);
   if(!userExist){
     final bytes = utf8.encode(userModel.password);
     userModel.password = sha1.convert(bytes).toString();
     await userRepository.insertUser(userModel.toMap());
     return true;

   }else{
     return false;
   }
}

  //logout
  Future<bool> logout() async{
    UserRepository userRepository = UserRepository();
    UserModel? user = await getCurrentUser();
    if(user != null){
      await userRepository.updateUserLoginStatus(user);
      return true;
    }
    return false;
  }

// Login
  Future<bool> login(String email, String password) async{
    UserRepository userRepository = UserRepository();
    //search user in the database
    UserModel? existUser = await searchUser(email);

    if(existUser != null){
      final bytes = utf8.encode(password);
      final encryptedPassword = sha1.convert(bytes);
      if(existUser.password == encryptedPassword.toString()){
        await userRepository.updateUserLoginStatus(existUser);
        return true;

      }else{
        return false;
      }
    }
    return false;
  }

  // get current user
  Future<UserModel?> getCurrentUser() async{
    UserRepository userRepository = UserRepository();
    final List<Map<String, dynamic>> maps = await userRepository.getCurrentUser();
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

  // search user
  Future<UserModel?> searchUser(String email) async{
    UserRepository userRepository = UserRepository();
    final List<Map<String, dynamic>> maps = await userRepository.searchUser(email);
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

  // update user exp and lvl
  Future updateUserExp() async{
    UserRepository userRepository = UserRepository();
    UserModel? userModel = await getCurrentUser();
    userModel!.exp = userModel.exp + 10;
    if(userModel.exp == 100){
      userModel.lvl = userModel.lvl + 1;
      userModel.exp = 0;
    }
    await userRepository.updateUser(userModel);
  }

  // spend coin
  Future spendCoin(UserModel userModel)async{
    await UserRepository().updateUser(userModel);
  }
}