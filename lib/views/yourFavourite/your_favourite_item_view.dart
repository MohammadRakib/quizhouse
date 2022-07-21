import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/your_favourite_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class YourFavouriteItemView extends StatelessWidget {
  YourFavouriteModel yourFavouriteModel;
  YourFavouriteItemView({Key? key,required this.yourFavouriteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: Image.asset(yourFavouriteModel.image),
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(yourFavouriteModel.title),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Text('You have completed '),
                    Text('${yourFavouriteModel.completion}%',
                      style: const TextStyle(
                        color: Color(primaryColor),
                      ),

                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    lineHeight: 8.0,
                    percent: double.parse(yourFavouriteModel.completion)/100,
                    progressColor: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
