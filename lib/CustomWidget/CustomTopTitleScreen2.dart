import 'package:flutter/material.dart';

import '../SizeConfig.dart';
import 'CustomBackButton.dart';

Widget CustomTopTitleScreen2(
    BuildContext context, String title, String iconPath) {
  return Container(
          height: SizeConfig.safeBlockVertical * 200,
          width:  SizeConfig.screenWidth,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.55,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: CustomBackButton(context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                        child: FractionallySizedBox(
                      widthFactor: 0.7,
                      heightFactor: 1,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontSize: SizeConfig.safeBlockHorizontal * 8,
                              color: Color.fromRGBO(238, 237, 237, 1),
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                    )),
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 1),
                    Image.asset(
                      iconPath,
                      width: SizeConfig.blockSizeHorizontal * 190,
                      height: SizeConfig.blockSizeVertical * 125,
                      //width: SizeConfig.blockSizeHorizontal * ,
                      //   height: SizeConfig.blockSizeVertical * 8,
                    ),
                  ],
                ),
              ),
            ),
          ]));
}
