import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/views/auth/login_view.dart';

import '../../core/utils/padding_margin.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: const Color(backGroundColor),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: orientation == Orientation.portrait? topPositionForGetStartedLogoPortrait : topPositionForGetStartedLogoLandscape,
              right: width/9,
              child: Image.asset('lib/assets/logo/quizLogo.png',
                  height: height/5,
                  width: width/1.3,
              ),
            ),

            Positioned(
              right: orientation == Orientation.portrait? width/8 : width/5.6,
              bottom: orientation == Orientation.portrait? bottomPositionForGetStartedButtonPortrait : bottomPositionForGetStartedButtonLandscape,
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: orientation == Orientation.portrait? MaterialStateProperty.all(Size(width/1.3, height/15)) : MaterialStateProperty.all(Size(width/1.5, height/11)),
                    backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute<String>(
                    builder: (BuildContext context) => LoginView(),
                  ),);
                },
                child: const Text('Get Started'),
              ),
            ),


            Positioned(
              bottom: orientation == Orientation.portrait? bottomPositionForGetStartedPolicyPortrait : bottomPositionForGetStartedPolicyLandscape,
              left: orientation == Orientation.portrait? width/7.5 : width/3.23,
              right: orientation == Orientation.portrait? width/7.5 : width/3.23,
              child: const Text('You are going to agree our Terms & Condition & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
