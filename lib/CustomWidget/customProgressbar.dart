import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testflutter/SizeConfig.dart';

Widget customProgressBar( String progress) {
  final double progressDouble = double.parse(progress);
  var color;

  if (progressDouble > 0.67) {
    color = Colors.green;
  } else if (progressDouble > 0.33) {
    color = Colors.yellow;
  } else {
    color = Colors.red;
  }

  return 
    LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      width: SizeConfig.blockSizeHorizontal * 27,//100.0,
      lineHeight: SizeConfig.blockSizeVertical * 1.1,//8.0,
      percent: progressDouble,
      progressColor: color,
      linearStrokeCap: LinearStrokeCap.butt,
    
  );
}
