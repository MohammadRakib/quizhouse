import 'package:flutter/material.dart';
import 'package:quizhouse/models/shop_item_model.dart';
import 'package:quizhouse/models/user_model.dart';
import 'package:quizhouse/services/shop_services.dart';
import 'package:quizhouse/services/user_services.dart';
import 'package:quizhouse/views/shop/coin/coin_item_view.dart';
import 'package:quizhouse/views/shop/gem/gem_item_view.dart';

class ShopVIewModel extends ChangeNotifier{
  List<ShopItemModel> _coinItems = [];
  List<ShopItemModel> _gemItems = [];
  List<CoinItemView> _coinItemViewList = [];
  List<GemItemView> _gemItemViewList = [];
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<ShopItemModel> get gemItems => _gemItems;

  set gemItems(List<ShopItemModel> value) {
    _gemItems = value;
  }

  List<GemItemView> get gemItemViewList => _gemItemViewList;

  set gemItemViewList(List<GemItemView> value) {
    _gemItemViewList = value;
    notifyListeners();
  }

  List<CoinItemView> get coinItemViewList => _coinItemViewList;

  set coinItemViewList(List<CoinItemView> value) {
    _coinItemViewList = value;
    notifyListeners();
  }

  List<ShopItemModel> get coinItems => _coinItems;

  set coinItems(List<ShopItemModel> value) {
    _coinItems = value;
  }

  ShopVIewModel(){
    getCoin();
    getGem();
  }

  Future getCoin()async{
    coinItems = await ShopServices().getCoin();
    coinItemViewList = generateCoinItem();
  }

  Future getGem()async{
    gemItems = await ShopServices().getGem();
    gemItemViewList = generateGemItem();
  }

  List<CoinItemView> generateCoinItem(){
    return List.generate(coinItems.length, (index) => CoinItemView(quantity: coinItems[index].quantity, price: coinItems[index].price));
  }

  List<GemItemView> generateGemItem(){
    return List.generate(gemItems.length, (index) => GemItemView(quantity: gemItems[index].quantity, price: gemItems[index].price));
  }

  //coin onTap
Future onTapCoin(String quantity, String price) async{
    UserModel? userModel = await UserServices().getCurrentUser();
    userModel!.coin = userModel.coin + int.parse(quantity);
    userModel.gems = userModel.gems - int.parse(price);
    await ShopServices().buyCoin(userModel);
}

// gem onTap
  Future onTapGem(String quantity, String price) async{
    UserModel? userModel = await UserServices().getCurrentUser();
    userModel!.gems = userModel.gems + int.parse(quantity);
    await ShopServices().buyGem(userModel);
  }

}