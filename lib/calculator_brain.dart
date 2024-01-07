import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'constants.dart';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  final double height;
  final int weight;

  double _bmi = 19; //private variable

  String calculateBMI(){
    _bmi = weight / pow (height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double getPercentage(){
    double result = (_bmi-14)/26;
    return result;
  }

  String getResult(){
    calculateBMI();
    if (_bmi >= 25){
      return 'Overweigth';
    } else if (_bmi > 18.5){
      return 'Normal';
    } else {
      return 'Underweigth';
    }
  }

  Row getInterpretation(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('You have '),
      Text(getResult(), style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, letterSpacing: 1)),
      Text(' body weight')
    ],);
  }
}