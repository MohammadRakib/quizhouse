import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

class CategoryItemView extends StatelessWidget {

  String name;
  String imageUri;
  int categoryId;

  CategoryItemView({Key? key,required this.name, required this.imageUri, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute<String>(
          builder: (BuildContext context) => PlayViewWrapper(title: name, categoryId: categoryId,),
        ),);
      },
    );
  }
}
