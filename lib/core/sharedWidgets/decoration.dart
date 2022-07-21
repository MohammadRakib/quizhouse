import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';



InputDecoration textFieldDecoration = const InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(textFieldBorderColor)),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(primaryColor)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(errorColor)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(errorColor)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  fillColor: Color(textFieldFillColor),
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  floatingLabelStyle: TextStyle(
    fontSize: 20.0,
    color: Color(primaryColor),
  ),

);