import 'package:flutter/material.dart';
import '../SizeConfig.dart';

Widget CustomBackButton(BuildContext context) {
  return
      IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        //padding: EdgeInsets.all(0),
        color: Theme.of(context).accentColor,
        //iconSize: SizeConfig.blockSizeVertical * 5,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      );
}
