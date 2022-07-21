import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {

  String heroTag;

  ResultView({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Hero(tag: heroTag, child: Container(

      color: Colors.white,
      height: orientation == Orientation.portrait? height/2 : height/1.2,
      width: orientation == Orientation.portrait? width/1.2 : width/2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: orientation == Orientation.portrait? const EdgeInsets.only(top: 5) : const EdgeInsets.only(top: 20),
              child: Image.asset(
                'lib/assets/icons/party.png',
                height: orientation == Orientation.portrait? height/7 : height/7,
                width: orientation == Orientation.portrait? width/7 : width/7,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: orientation == Orientation.portrait? height/50 : height/50,
                ),
                child: const Text(
                  'Congratulations, You have answered all questions correctly!!',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),

    ));
  }
}
