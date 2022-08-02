import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/viewModels/shop/shop_view_model.dart';

class ShopGemView extends StatelessWidget {
  const ShopGemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopVIewModel shopVIewModel = context.watch<ShopVIewModel>();
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
          itemCount: shopVIewModel.gemItemViewList.length,
          itemBuilder: (context, index) {
            return shopVIewModel.gemItemViewList[index];
          },
        )
    );
  }
}
