import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';

class CoinItemView extends StatelessWidget {
  const CoinItemView({Key? key}) : super(key: key);

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
                  child: Text('100 coin',
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
                padding: const EdgeInsets.all(5.0),
                child: Text('20 gems',
                  style: TextStyle(color: coinPriceColor,
                    fontSize: orientation == Orientation.portrait? width/38 : width/40,
                  ),
                ),
              )),
          )
        ],
      ),
    );
  }
}
