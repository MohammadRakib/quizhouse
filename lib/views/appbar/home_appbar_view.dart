import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/appbar/home_appbar_view_model.dart';
import 'package:provider/provider.dart';

class HomeAppBarView extends StatelessWidget implements PreferredSizeWidget{

  final double height;
  const HomeAppBarView({Key? key, this.height = kToolbarHeight,}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    HomeAppBarViewModel homeAppBarViewModel = context.watch<HomeAppBarViewModel>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Container(
      height: preferredSize.height,
      color: const Color(appBarColor),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/dummyImage.png'),
              backgroundColor: Color(appBarColor),
            ),
          ),

          Positioned(
            top: 11,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hi, ${homeAppBarViewModel.name}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Color(appBarTitleColor),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    'your current level is ${homeAppBarViewModel.level}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(appBarSubTitleColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 1,
              child: IconButton(
                  onPressed: (){
                    
                  },
                  icon: const Icon(Icons.menu,
                    color: Color(primaryColor),
                  ),
              ),
          ),

        ],
      ),
    );
  }
}
