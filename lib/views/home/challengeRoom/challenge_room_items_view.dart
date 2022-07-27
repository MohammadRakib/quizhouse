import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/challenge_room_model.dart';

class ChallengeRoomItemsView extends StatelessWidget {

  ChallengeRoomModel challengeRoomModel;

  ChallengeRoomItemsView({Key? key, required this.challengeRoomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    double cardWidthP = width/1.2;
    double cardWidthL = width/2.5;

    return Container(
      color: Color(int.parse(challengeRoomModel.color)),
        width: orientation == Orientation.portrait? cardWidthP : cardWidthL,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.info,
                 color: Colors.white,
                  size: orientation == Orientation.portrait? cardWidthP/15 : cardWidthL/14,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: orientation == Orientation.portrait? cardWidthP/3 : cardWidthL/3,
            left: 0,
            right: 0,
            child: Text(challengeRoomModel.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(challengeNameColor),
              fontSize: orientation == Orientation.portrait? cardWidthP/20 : cardWidthL/18,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),

          Positioned(
            bottom: orientation == Orientation.portrait? cardWidthP/5.6 : cardWidthL/6,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: orientation == Orientation.portrait? cardWidthP/15 : cardWidthL/15,
                margin:  const EdgeInsets.symmetric(horizontal: 15,),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: darken(Color(int.parse(challengeRoomModel.color)), .2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Prize: ${challengeRoomModel.prize}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(challengePrizeColor),
                        fontSize: orientation == Orientation.portrait? cardWidthP/30 : cardWidthL/30,
                      ),
                      ),
                      const SizedBox(width: 5,),
                      Image.asset('lib/assets/icons/coin.png',
                        width: orientation == Orientation.portrait? cardWidthP/22 : cardWidthL/22,
                        height: orientation == Orientation.portrait? height/22 : height/22,

                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: orientation == Orientation.portrait? cardWidthP/10 : cardWidthL/9,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Entry Fee: ${challengeRoomModel.entryFee}',
                    style: TextStyle(
                      color: const Color(challengeEntryFeeColor),
                      fontSize: orientation == Orientation.portrait? cardWidthP/38 : cardWidthL/41,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Image.asset('lib/assets/icons/coin.png',
                    width: orientation == Orientation.portrait? cardWidthP/28 : cardWidthL/30,
                    height: orientation == Orientation.portrait? height/28 : height/30,

                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 13,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Players in Online: 0',
                style: TextStyle(
                  color: const Color(challengeOnlinePlayerColor),
                  fontSize:  orientation == Orientation.portrait? cardWidthP/41 : cardWidthL/48,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
