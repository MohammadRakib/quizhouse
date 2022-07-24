import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/home/playerStatus/player_status_view_model.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../viewModels/home/home_view_model.dart';

class PlayerStatusView extends StatelessWidget {
  PlayerStatusView({Key? key}) : super(key: key);

  String level = '1';
  String levelPercentage = '0';
  String coin = '10000';
  String gems = '10000';

  @override
  Widget build(BuildContext context) {

    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    if(homeViewModel.playerStatusViewModel != null){
      level = homeViewModel.playerStatusViewModel!.level;
      levelPercentage = homeViewModel.playerStatusViewModel!.levelPercentage;
      coin = homeViewModel.playerStatusViewModel!.coin;
      gems = homeViewModel.playerStatusViewModel!.gems;
    }

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      color: const Color(appBarColor),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            height: orientation == Orientation.portrait? height/32 : height/19,

            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(
                    color: const Color(primaryColor),
                    width: 1,
              ),
              color: const Color(playerStatusLevelColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: CircularPercentIndicator(
                    radius: orientation == Orientation.portrait? height/93 : width/105,
                    lineWidth: 1.0,
                    percent: double.parse(levelPercentage),
                    center: Text("$levelPercentage%",
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait? height/155 : width/165,
                    ),
                    ),
                    progressColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 3,),
                Text('Level $level',
                 style: TextStyle(
                   fontSize: orientation == Orientation.portrait? height/100 : width/110,
                 ),
                ),
                const SizedBox(width: 4,),
              ],
            ),
          ),

          const SizedBox(width: 5,),

          Container(
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
                Text(coin,
                  style: TextStyle(
                    fontSize: orientation == Orientation.portrait? height/100 : width/110,
                  ),
                ),
                const SizedBox(width: 4,),
              ],
            ),
          ),

          const SizedBox(width: 5,),

          Container(
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
                Text(gems,
                  style: TextStyle(
                    fontSize: orientation == Orientation.portrait? height/100 : width/110,
                  ),
                ),
                const SizedBox(width: 4,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
