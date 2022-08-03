import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/views/shop/coin/shop_coin_view.dart';
import 'package:quizhouse/views/shop/gem/shop_gem_view.dart';
import 'package:quizhouse/views/shop/shop_player_status.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  Widget listItem(int index){
    if(index == 0){
     return Padding(
       padding: const EdgeInsets.only(bottom: 10),
       child: Container(
         color: shopLabelBarColor,
         height: 45,
         child: const Center(child: Text('Buy Coins',
          style: TextStyle(color: shopLabelColor),
         )),
       ),
     );
    }
    else if(index == 1){
      return const ShopCoinView();
    }
    else if(index == 2){
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          color: shopLabelBarColor,
          height: 45,
          child: const Center(child: Text('Buy Gems',
            style: TextStyle(color: shopLabelColor),
          )),
        ),
      );
    }
    else{
      return const ShopGemView();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ShopPlayerStatus(),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index) => listItem(index)
      ),
    );
  }
}
