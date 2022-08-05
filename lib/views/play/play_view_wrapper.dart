import 'package:flutter/material.dart';
import 'package:quizhouse/views/play/play_view.dart';
import '../../core/utils/color.dart';

class PlayViewWrapper extends StatelessWidget {

  String title;
  int categoryId;
  String playType;
  PlayViewWrapper({Key? key, required this.title, required this.categoryId, required this.playType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(title,
          style: const TextStyle(
            color: Color(appBarTitleColor),
          ),
        ),
        backgroundColor: const Color(appBarColor),
      ),
      body: SingleChildScrollView(
        child: PlayView(categoryId: categoryId,playType: playType,),
      ),
    );
  }
}
