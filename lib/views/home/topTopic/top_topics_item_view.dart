import 'package:flutter/material.dart';
import 'package:quizhouse/models/top_topics_model.dart';

import '../../../core/utils/color.dart';

class TopTopicsItemView extends StatelessWidget {
  TopTopicsModel topicsModel;
  TopTopicsItemView({Key? key,required this.topicsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    double cardWidthP = width/3;
    double cardWidthL = width/4;
    return Container(
      width: orientation == Orientation.portrait? cardWidthP : cardWidthL,
      margin: orientation == Orientation.portrait? const EdgeInsets.fromLTRB(10, 8, 3, 10) : const EdgeInsets.fromLTRB(10, 8, 7, 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Color(topTopicsItemViewColor),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: orientation == Orientation.portrait? cardWidthP/16 : cardWidthL/18,),
          Image.asset(topicsModel.imageUri,
            height: orientation == Orientation.portrait? cardWidthP/2.5 : cardWidthL/3.5,
            width: orientation == Orientation.portrait? cardWidthP/2.5 : cardWidthL/3.5,
          ),
          SizedBox(height: orientation == Orientation.portrait? cardWidthP/16 : cardWidthL/18,),
          Text(topicsModel.title,
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: orientation == Orientation.portrait? cardWidthP/13 : cardWidthL/14,
            ),
          ),
          SizedBox(height: orientation == Orientation.portrait? cardWidthP/16 : cardWidthL/18,),
        ],
      ),
    );
  }
}
