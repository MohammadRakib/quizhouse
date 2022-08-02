import 'package:quizhouse/models/shop_item_model.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/repository/shop_repository.dart';
import 'package:quizhouse/repository/user_repository.dart';

class ShopServices{
  //coin
  Future<List<ShopItemModel>> getCoin() async{
    ShopRepository shopRepository = ShopRepository();
    await shopRepository.createCoinTable();
    List<Map<String, dynamic>> maps = await shopRepository.loadCoin();
    if(maps.isNotEmpty){
      final coinList = List.generate(maps.length, (i)
      {
        return ShopItemModel(quantity: maps[i]['quantity'], price: maps[i]['price']);
      });
      return coinList;
    }
    return [];
  }

  Future buyCoin(UserModel userModel) async{
    await UserRepository().updateUser(userModel);
  }

  Future buyGem(UserModel userModel) async{
    await UserRepository().updateUser(userModel);
  }

  //gem
  Future<List<ShopItemModel>> getGem() async{
    ShopRepository shopRepository = ShopRepository();
    await shopRepository.createGemTable();
    List<Map<String, dynamic>> maps = await shopRepository.loadGem();
    if(maps.isNotEmpty){
      final gemList = List.generate(maps.length, (i)
      {
        return ShopItemModel(quantity: maps[i]['quantity'], price: maps[i]['price']);
      });
      return gemList;
    }
    return [];
  }

}