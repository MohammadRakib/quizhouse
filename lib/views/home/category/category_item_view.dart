import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

class CategoryItemView extends StatelessWidget {

  String name;
  String imageUri;
  String completion;
  CategoryItemView({Key? key,required this.name, required this.imageUri, required this.completion}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(imageUri),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(name),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      const Text('You have completed '),
                      Text('$completion%',
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
                      percent: double.parse(completion)/100,
                      progressColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute<String>(
          builder: (BuildContext context) => PlayViewWrapper(title: name,),
        ),);
      },
    );
  }
}
