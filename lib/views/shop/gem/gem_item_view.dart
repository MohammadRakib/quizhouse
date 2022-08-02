import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';

class GemItemView extends StatelessWidget {
  const GemItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Container(
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
                  child: Text('100 gems',
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
                  child: Text('20 BDT',
                    style: TextStyle(color: gemPriceColor,
                      fontSize: orientation == Orientation.portrait? width/38 : width/35,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
