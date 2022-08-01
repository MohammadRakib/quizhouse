import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';

class CoinItemView extends StatelessWidget {
  const CoinItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: coinItemBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: Column(
              children: [
                Image.asset('lib/assets/icons/coin.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('100 coin',
                    style: TextStyle(color: coinNumberTextColor),
                  ),
                ),
              ],
            ),
          ),
          Container(color: coinPriceBarColor,
          width: double.infinity,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('20 gems',
                  style: TextStyle(color: coinPriceColor),
                ),
              )),
          )
        ],
      ),
    );
  }
}
