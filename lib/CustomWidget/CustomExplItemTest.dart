import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../SizeConfig.dart';

Widget CustomExplItemTest(BuildContext context, String text) {
  return Container(
      //height: SizeConfig.blockSizeVertical * 200,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all( SizeConfig.safeBlockHorizontal * 3),
      child: Text(text,
          textAlign: TextAlign.start,
          style: new TextStyle(
            // color: Theme.of(context).accentColor,
            color: Color.fromRGBO(238, 237, 237, 1),
            //   fontSize: 50.0,
            fontWeight: FontWeight.w300,
            height: SizeConfig.safeBlockHorizontal * 0.4,
            fontSize: SizeConfig.safeBlockHorizontal * 4
          )));
}
