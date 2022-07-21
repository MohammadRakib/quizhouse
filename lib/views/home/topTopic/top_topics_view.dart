import 'package:flutter/material.dart';
import 'package:quizhouse/viewModels/home/topTopic/top_topics_view_model.dart';
import 'package:quizhouse/views/home/topTopic/top_topics_item_view.dart';
import 'package:provider/provider.dart';

class TopTopicsView extends StatelessWidget {
  const TopTopicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopTopicsViewModel topTopicsViewModel = context.watch<TopTopicsViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Top Topics',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: orientation == Orientation.portrait? width : width,
          height: orientation == Orientation.portrait? height/3.5 : height/2.5,
          child: ListView.builder(
            itemCount: topTopicsViewModel.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) => TopTopicsItemView(topicsModel: topTopicsViewModel.items[index]),
         ),
        ),
      ],
    );
  }
}
