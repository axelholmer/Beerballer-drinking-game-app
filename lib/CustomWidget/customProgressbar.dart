import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget customProgressBar( String progress) {
  final double progressDouble = double.parse(progress);
  var color;

  if (progressDouble > 0.67) {
    color = Colors.blue;
  } else if (progressDouble > 0.33) {
    color = Colors.yellow;
  } else {
    color = Colors.red;
  }

  return Column(children: <Widget>[
    LinearPercentIndicator(
      width: 100.0,
      lineHeight: 8.0,
      percent: progressDouble,
      progressColor: color,
      linearStrokeCap: LinearStrokeCap.butt,
    )
  ]);
}
