import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quizhouse/models/challenge_room_model.dart';
import 'package:quizhouse/viewModels/home/challengeRoom/challenge_room_view_model.dart';
import 'package:quizhouse/views/home/challengeRoom/challenge_room_items_view.dart';
import 'package:provider/provider.dart';

class ChallengeRoomView extends StatelessWidget {
  ChallengeRoomView({Key? key}) : super(key: key);

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    ChallengeRoomViewModel challengeRoomViewModel = context.watch<ChallengeRoomViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    final List<Widget> challengeListSliders = challengeRoomViewModel.challengeListSliders;

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

        children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Challenge Room',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),

            CarouselSlider(
              items: challengeListSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  viewportFraction: orientation == Orientation.portrait?0.8 : 0.4,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: orientation == Orientation.portrait? 2.5 : 4.7,
                  onPageChanged: (index, reason) {
                    challengeRoomViewModel.current = index;
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: challengeRoomViewModel.items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(challengeRoomViewModel.current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
    ]
    );
  }
}
