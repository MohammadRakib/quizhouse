import 'package:flutter/material.dart';
import 'package:quizhouse/views/shop/coin/coin_item_view.dart';

class ShopCoinView extends StatelessWidget {
  const ShopCoinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const CoinItemView();
          },
        )
    );
  }
}
