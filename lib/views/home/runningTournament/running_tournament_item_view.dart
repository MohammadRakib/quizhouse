import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/running_tournament_model.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

class RunningTournamentItemView extends StatelessWidget {

  String title;
  String time;
  String prize;
  int color;

  RunningTournamentItemView({Key? key, required this.title, required this.time, required this.prize, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    double cardWidthP = width/1.2;
    double cardWidthL = width/2.5;

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute<String>(
          builder: (BuildContext context) => PlayViewWrapper(title: title, categoryId: 0, playType: 'Running Tournament',),
        ),);
      },
      child: Container(
        width: orientation == Orientation.portrait? cardWidthP : cardWidthL,
        // height: cardContainerHeight,
        // width: 250,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: Color(color),
        ),
        margin: const EdgeInsets.all(8),
        child: Stack(
          fit: StackFit.expand,
          children: [

            Positioned(
              top: orientation == Orientation.portrait? cardWidthP/25 : cardWidthL/25,
              right: orientation == Orientation.portrait? cardWidthP/30 : cardWidthL/30,
              // top: 10,
              // right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: darken(Color(color), .1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 4,),
                      Icon(Icons.watch_later_outlined,
                        color: Colors.white,
                        size: orientation == Orientation.portrait? cardWidthP/30 : cardWidthL/30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text('$time remaining',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait? cardWidthP/40 : cardWidthL/40,
                          // fontSize: 7,
                          color: const Color(runningTournamentTimeColor),
                        ),
                        ),
                      ),
                      const SizedBox(width: 4,),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: orientation == Orientation.portrait? cardWidthP/10 : cardWidthL/10,
              left: orientation == Orientation.portrait? cardWidthP/20 : cardWidthL/15,
              // top: 40,
              // left: 15,
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(runningTournamentTitleColor),
                  fontSize: orientation == Orientation.portrait? cardWidthP/20 : cardWidthL/18,
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Positioned(
              bottom: orientation == Orientation.portrait? cardWidthP/25 : cardWidthL/25,
              // bottom: 15,
              right: 0,
              left: 0,
              child: Container(
                height: orientation == Orientation.portrait? cardWidthP/13 : cardWidthL/13,
                // height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color(runningTournamentPrizeContainerColor),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (height <= 307) && (width <= 653 )? 6 :  10,
                      vertical: (height <= 307) && (width <= 653 )? 4 :  5,
                    // horizontal: 10,
                    // vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 4,),
                      Image.asset('lib/assets/icons/trophy.png',
                       height: orientation == Orientation.portrait? cardWidthP/30 : cardWidthL/10,
                       width: orientation == Orientation.portrait? cardWidthP/30 : cardWidthL/10,
                       //  height: 10,
                       //  width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text('Win $prize',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait? cardWidthP/40 : cardWidthL/40,
                            // fontSize: 7,
                            color: darken(Color(color), .1),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
