import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';

class ShopPlayerStatus extends StatelessWidget implements PreferredSizeWidget{
  final double height;
  const ShopPlayerStatus({Key? key, this.height = kToolbarHeight,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Container(
        color: const Color(appBarColor),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                left: 3,
                child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_rounded))
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 70,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                height: orientation == Orientation.portrait? height/32 : height/19,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: const Color(primaryColor),
                    width: 1,
                  ),
                  color: const Color(playerStatusGoldCoinColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('lib/assets/icons/coin.png',
                      width: orientation == Orientation.portrait? width/30 : width/32,
                      height: orientation == Orientation.portrait? height/30 : height/32,
                    ),
                    const SizedBox(width: 3,),
                    Text(userViewModel.coin,
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait? height/100 : width/110,
                      ),
                    ),
                    const SizedBox(width: 4,),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 0,
              bottom: 0,
              right: 10,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                height: orientation == Orientation.portrait? height/32 : height/19,
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: const Color(primaryColor),
                    width: 1,
                  ),
                  color: const Color(playerStatusGoldCoinColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('lib/assets/icons/diamond.png',
                      width: orientation == Orientation.portrait? width/30 : width/32,
                      height: orientation == Orientation.portrait? height/30 : height/32,
                    ),
                    const SizedBox(width: 3,),
                    Text(userViewModel.gems,
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait? height/100 : width/110,
                      ),
                    ),
                    const SizedBox(width: 4,),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10,),

          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
