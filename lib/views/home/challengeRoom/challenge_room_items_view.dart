import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/user/user_view_model.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

class ChallengeRoomItemsView extends StatelessWidget {
  String name;
  String prize;
  String entryFee;
  int color;

  ChallengeRoomItemsView({Key? key, required this.name, required this.prize, required this.entryFee, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    double cardWidthP = width/1.2;
    double cardWidthL = width/2.5;

    return InkWell(
      onTap: (){

        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Do you want to challenge for $entryFee coin?'),
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
                    userViewModel.spendCoins(entryFee);
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute<String>(
                      builder: (BuildContext context) => PlayViewWrapper(title: name, categoryId: 0, playType: 'challenge room',),
                    ),);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        color: Color(color),
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
              child: Text(name,
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
                    color: darken(Color(color), .2),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Prize: $prize',
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
                    Text('Entry Fee: $entryFee',
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

          ],
        ),
      ),
    );
  }
}
