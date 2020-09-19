import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/InfoButton.dart';

import '../SizeConfig.dart';
import 'CustomBackButton.dart';

typedef void HideInfoExpl();

Widget CustomTopTitleWidgetInfoPage(
    BuildContext context) {
  return Container(
          height: SizeConfig.safeBlockVertical * 110,
          width:  SizeConfig.screenWidth,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: 
                FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: CustomBackButton(context),
                ),
              ),
            ),
          ]));
}
