import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/core/sharedWidgets/Loading.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/shop/shop_view_model.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';

class GemItemView extends StatelessWidget {
  String quantity;
  String price;
  GemItemView({Key? key, required this.quantity, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopVIewModel shopVIewModel = context.watch<ShopVIewModel>();
    UserViewModel userViewModel = context.watch<UserViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    return shopVIewModel.loading? const Loading() : InkWell(
      splashColor: darken(coinItemBackgroundColor),
      onTap: (){
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Do you want to buy $quantity gems for $price?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () async{
                    Navigator.of(context).pop();
                    shopVIewModel.loading = true;
                    await shopVIewModel.onTapGem(quantity, price);
                    shopVIewModel.loading = false;
                    userViewModel.getCurrentUser(); // it is gonna update user information visually
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        color: gemItemBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: orientation == Orientation.portrait? 17 : 40),
              child: Column(
                children: [
                  Image.asset('lib/assets/icons/diamondShop.png',
                    width: orientation == Orientation.portrait? width/15 : width/5,
                    height: orientation == Orientation.portrait? height/15 : height/5,

                  ),
                  Padding(
                    padding: EdgeInsets.only(top: orientation == Orientation.portrait? 0 : 8),
                    child: Text('$quantity Gems',
                      style: TextStyle(color: gemNumberTextColor,
                        fontSize: orientation == Orientation.portrait? width/38 : width/40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(color: gemPriceBarColor,
              width: double.infinity,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(price,
                      style: TextStyle(color: gemPriceColor,
                        fontSize: orientation == Orientation.portrait? width/38 : width/35,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
