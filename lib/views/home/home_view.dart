import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/models/category_model.dart';
import 'package:quizhouse/viewModels/home/category/category_view_model.dart';
import 'package:quizhouse/viewModels/home/home_view_model.dart';
import 'package:quizhouse/views/appbar/home_appbar_view.dart';
import 'package:quizhouse/views/home/category/category_item_view.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_view.dart';
import 'package:quizhouse/views/home/playerStatus/player_status_view.dart';
import 'package:quizhouse/views/home/runningTournament/running_tournament_view.dart';
import 'package:provider/provider.dart';
import 'bcs/bcs_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(homeBackGroundColor),
        appBar: HomeAppBarView(height: 61,),
        body: ListView.builder(
          itemCount: 5 + categoryViewModel.categoryItem.length,
          itemBuilder: (context,index) =>  homeViewModel.buildListView(index,categoryViewModel.categoryItem),
        ),
      ),
    );
  }
}
