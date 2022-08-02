import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';

class CoinItemView extends StatelessWidget {
  String quantity;
  String price;
  CoinItemView({Key? key, required this.quantity, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: coinItemBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: orientation == Orientation.portrait? 17 : 40),
            child: Column(
              children: [
                Image.asset('lib/assets/icons/coinShop.png',
                  width: orientation == Orientation.portrait? width/15 : width/5,
                  height: orientation == Orientation.portrait? height/15 : height/5,

                ),
                Padding(
                  padding: EdgeInsets.only(top: orientation == Orientation.portrait? 0 : 8),
                  child: Text('$quantity coins',
                    style: TextStyle(color: coinNumberTextColor,
                    fontSize: orientation == Orientation.portrait? width/38 : width/35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(color: coinPriceBarColor,
          width: double.infinity,
          child: Center(
              child: Padding(
                padding: EdgeInsets.all(orientation == Orientation.portrait? 0 : 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: orientation == Orientation.portrait? 5 : 0,),
                      child: Text(price,
                        style: TextStyle(color: coinPriceColor,
                          fontSize: orientation == Orientation.portrait? width/38 : width/40,
                        ),
                      ),
                    ),
                    Image.asset('lib/assets/icons/diamondShop.png',
                      width: orientation == Orientation.portrait? width/30 : width/18,
                      height: orientation == Orientation.portrait? height/30 : height/18,
                    ),
                  ],
                ),
              )),
          )
        ],
      ),
    );
  }
}
