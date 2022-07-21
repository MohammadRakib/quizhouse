import 'package:flutter/material.dart';
import 'package:quizhouse/viewModels/play/play_view_model.dart';
import 'package:quizhouse/views/play/play_view.dart';
import 'package:quizhouse/views/play/timer_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color.dart';

class PlayViewWrapper extends StatelessWidget {

  String title;
  PlayViewWrapper({Key? key, required this.title}) : super(key: key);

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
      body: ChangeNotifierProvider<PlayViewModel>(
        create: (context) => PlayViewModel(),
        child: SingleChildScrollView(
          child: PlayView(),
        ),
      ),
    );
  }
}
