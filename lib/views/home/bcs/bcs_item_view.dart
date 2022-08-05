import 'package:flutter/material.dart';
import 'package:quizhouse/models/bcs_model.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

import '../../../core/utils/color.dart';


class BcsItemView extends StatelessWidget {

  String title;
  String questionNumber;
  String duration;
  String price;
  BcsItemView({Key? key,required this.title, required this.questionNumber, required this.duration, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;
    double cardWidthP = width/1.8;
    double cardWidthL = width/2.5;


    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute<String>(
          builder: (BuildContext context) => PlayViewWrapper(title: title, categoryId: 0, playType: 'BCS',),
        ),);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(bcsItemViewColor),
        ),
        width: orientation == Orientation.portrait? cardWidthP : cardWidthL,
        margin: orientation == Orientation.portrait? const EdgeInsets.fromLTRB(0, 5, 5, 10) : const EdgeInsets.fromLTRB(0, 8, 17, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: orientation == Orientation.portrait? cardWidthP/20 : cardWidthL/20,
                ),
                Image.asset('lib/assets/logo/BD Govt. Logo.png',
                  height: orientation == Orientation.portrait? cardWidthP/5 : cardWidthL/6,
                  width: orientation == Orientation.portrait? cardWidthP/5 : cardWidthL/6,
                ),
                SizedBox(
                  width: orientation == Orientation.portrait? cardWidthP/20 : cardWidthL/20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                    ),
                    Text(title,
                      style: TextStyle(
                        fontSize: orientation == Orientation.portrait? cardWidthP/18 : cardWidthL/20,
                      ),
                    ),
                    SizedBox(
                      height: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.list_alt,
                          size: orientation == Orientation.portrait? cardWidthP/15 : cardWidthL/16,
                        ),
                        SizedBox(
                          width: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                        ),
                        Text('$questionNumber questions',
                         style: TextStyle(
                           fontSize: orientation == Orientation.portrait? cardWidthP/22 : cardWidthL/24,
                         ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          size: orientation == Orientation.portrait? cardWidthP/15 : cardWidthL/16,
                        ),
                        SizedBox(
                          width: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                        ),
                        Text('$duration minutes',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait? cardWidthP/22 : cardWidthL/24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: orientation == Orientation.portrait? cardWidthP/35 : cardWidthL/45,
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Divider(
                height: 3,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: orientation == Orientation.portrait? cardWidthP/40 : cardWidthL/45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Play for $price',
                style: TextStyle(
                  fontSize: orientation == Orientation.portrait? cardWidthP/22 : cardWidthL/24,
                  color: const Color(bcsPriceColor),
                ),
                ),

              ],
            ),
            SizedBox(
              height: orientation == Orientation.portrait? cardWidthP/45 : cardWidthL/45,
            ),
          ],
        ),
      ),
    );
  }
}
