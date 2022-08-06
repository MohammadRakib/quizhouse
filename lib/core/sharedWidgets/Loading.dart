import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizhouse/core/utils/color.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade50,
      child: const Center(
        child: SpinKitWanderingCubes(
          color: Color(primaryColor),
          size: 50.0,
        ),
      ),

    );
  }
}
