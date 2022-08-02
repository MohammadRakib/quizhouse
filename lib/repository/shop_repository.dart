import 'package:quizhouse/models/shop_item_model.dart';

import 'db_repository.dart';

class ShopRepository{
  //coin
  Future createCoinTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String quantity = 'quantity TEXT NOT NULL';
    String price = 'price TEXT NOT NULL';

    String sqlCoin = 'CREATE TABLE IF NOT EXISTS coin($id, $quantity, $price)';
    db.execute(sqlCoin);
  }

  Future addCoinItem(List<ShopItemModel> coinList) async{
    final db = await DbRepository().database;

    for(ShopItemModel x in coinList){
      await db.insert('coin', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadCoin() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('coin');

    final List<ShopItemModel> coinList = [
      ShopItemModel(quantity: '100', price: '50'),
      ShopItemModel(quantity: '500', price: '1000'),
      ShopItemModel(quantity: '1000', price: '2000'),
      ShopItemModel(quantity: '2000', price: '3000'),
      ShopItemModel(quantity: '5000', price: '6000'),
      ShopItemModel(quantity: '10000', price: '8000'),
    ];
    if(maps.isNotEmpty){
      return maps;
    }else{
      await addCoinItem(coinList);
      return await loadCoin();
    }
  }

  //gems
  Future createGemTable() async{
    final db = await DbRepository().database;
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String quantity = 'quantity TEXT NOT NULL';
    String price = 'price TEXT NOT NULL';

    String sqlGem = 'CREATE TABLE IF NOT EXISTS gem($id, $quantity, $price)';
    db.execute(sqlGem);
  }

  Future addGemItem(List<ShopItemModel> gemList) async{
    final db = await DbRepository().database;

    for(ShopItemModel x in gemList){
      await db.insert('gem', x.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> loadGem() async{
    final db = await DbRepository().database;
    final List<Map<String, dynamic>> maps = await db.query('gem');

    final List<ShopItemModel> gemList = [
      ShopItemModel(quantity: '100', price: '50 BDT'),
      ShopItemModel(quantity: '500', price: '100 BDT'),
      ShopItemModel(quantity: '1000', price: '150 BDT'),
      ShopItemModel(quantity: '2000', price: '300 BDT'),
      ShopItemModel(quantity: '5000', price: '500 BDT'),
      ShopItemModel(quantity: '10000', price: '800 BDT'),
    ];
    if(maps.isNotEmpty){
      return maps;
    }else{
      await addGemItem(gemList);
      return await loadGem();
    }
  }
}
