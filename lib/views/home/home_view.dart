import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/home/category/category_view_model.dart';
import 'package:quizhouse/viewModels/home/home_view_model.dart';
import 'package:quizhouse/views/appbar/home_appbar_view.dart';
import 'package:provider/provider.dart';

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
