// import 'package:flutter/material.dart';
// import 'package:gblquiz/models/question_model.dart';
// import 'package:gblquiz/viewModels/play/question_view_model.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';
//
// import '../../core/utils/color.dart';
//
// class TimerView extends StatelessWidget {
//   const TimerView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     PlayViewModel playViewModel = Provider.of<PlayViewModel>(context, listen: false);
//
//     return Consumer<PlayViewModel>(
//         builder: (context, provider, listTile){
//           return Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: LinearPercentIndicator(
//               width: MediaQuery.of(context).size.width - 50,
//               animation: true,
//               lineHeight: 20.0,
//               animationDuration: 2500,
//               percent: 1.0,
//               center: Text('${playViewModel.items[0].questionNo}'),
//               barRadius: const Radius.circular(20),
//               progressColor: Colors.grey.shade300,
//               backgroundColor: const Color(secondaryColor),
//               isRTL: true,
//               onAnimationEnd: (){
//                 playViewModel.updateQuestionNo(0);
//               },
//             ),
//           );
//         }
//     );
//   }
// }
