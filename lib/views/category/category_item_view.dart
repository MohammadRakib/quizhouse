import 'package:flutter/material.dart';
import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/viewModels/category/category_view_model.dart';
import 'package:quizhouse/views/play/play_view.dart';
import 'package:quizhouse/views/play/play_view_wrapper.dart';

import '../../core/utils/color.dart';

class CategoryItemView extends StatelessWidget {

  CategoryModel categoryModel;
  CategoryItemView({Key? key,required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return InkWell(
      child: Container(
        margin: orientation == Orientation.portrait? const EdgeInsets.fromLTRB(10, 8, 10, 10) : const EdgeInsets.fromLTRB(10, 8, 10, 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Color(topTopicsItemViewColor),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/50),
                  child: Icon(Icons.star,
                    color: Colors.grey,
                    size: orientation == Orientation.portrait? width/30 : width/30,
                  ),
                ),
              ],
            ),

            SizedBox(height: orientation == Orientation.portrait? height/40 : height/40,),
            Image.asset(categoryModel.imageUri,
              height: orientation == Orientation.portrait? width/6 : width/8,
              width: orientation == Orientation.portrait? width/6 : width/8,
            ),
            const SizedBox(height: 10,),
            Text(categoryModel.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: orientation == Orientation.portrait? width/20 : width/25,
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute<String>(
          builder: (BuildContext context) => PlayViewWrapper(title: categoryModel.title,),
        ),);
      },
    );
  }
}
