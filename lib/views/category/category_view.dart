import 'package:flutter/material.dart';
import 'package:quizhouse/viewModels/category/category_view_model.dart';
import 'package:quizhouse/views/category/category_item_view.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel categoryViewModel = context.watch<CategoryViewModel>();
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: const Color(homeBackGroundColor),
      appBar: AppBar(
        title: const Text(
          'Category',
          style: TextStyle(
            color: Color(appBarTitleColor),
          ),
        ),
        backgroundColor: const Color(appBarColor),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 9),
            child: Icon(Icons.menu,
              color: Color(primaryColor),
            ),
          ),
        ],
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.8,
        children: List.generate(categoryViewModel.items.length, (index) {
          return CategoryItemView(
              categoryModel: categoryViewModel.items[index]);
        }),
      ),
    );
  }
}
