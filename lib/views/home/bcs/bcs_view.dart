import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewModels/home/bcs/bcs_view_model.dart';
import 'bcs_item_view.dart';

class BcsView extends StatelessWidget {
  BcsView({Key? key}) : super(key: key);

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    BcsViewModel bcsViewModel = context.watch<BcsViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    final List<Widget> bcsSlider = bcsViewModel.items
        .map((item) => Stack(
          children: <Widget>[
            BcsItemView(bcsModel: item),
          ],
        ))
        .toList();


    return Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('BCS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10,),

          CarouselSlider(
            items: bcsSlider,
            carouselController: _controller,
            options: CarouselOptions(
                viewportFraction: orientation == Orientation.portrait?0.6 : 0.4,
                autoPlay: true,
                aspectRatio: orientation == Orientation.portrait? 2.5 : 4,
                onPageChanged: (index, reason) {
                  bcsViewModel.current = index;
                }),
          ),
        ]
    );
  }
}
