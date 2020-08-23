import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './SizeConfig.dart';

typedef void CardToogle();
Widget CustomCardNeverEverHaveI(
    BuildContext context, CardToogle onCardToogle) {
  return  InkWell(
                onTap: () {
                onCardToogle();
                },
                child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 1,
        child: Image.asset(
          "./assets/images/IconsInGame/neverEverHaveiIcon.jpg",
          // width: SizeConfig.blockSizeHorizontal * 190,
          // height: SizeConfig.blockSizeVertical * 125,
          //width: SizeConfig.blockSizeHorizontal * ,
          //   height: SizeConfig.blockSizeVertical * 8,
        ),
      )),
      Flexible(
          child: FractionallySizedBox(
              heightFactor: 0.55,
              widthFactor: 1,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: AutoSizeText(
                    "Ich habe noch nie",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //  fontSize: SizeConfig.safeBlockHorizontal * 7,
                      //height: 2,
                      //  height: SizeConfig.safeBlockVertical * 0.23,
                      //fontFamily: 'Oswald',
                      fontWeight: FontWeight.w900,
                    ),
                  )))),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 80,
      ),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 1.4,
        widthFactor: 0.9,
        alignment: Alignment.bottomCenter,
        child: AutoSizeText("*Deck mich auf*",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 6,
            //  height: SizeConfig.safeBlockVertical * ,
              //   height: SizeConfig.safeBlockVertical * 0.23,
              //  fontFamily: 'Oswald',
              fontWeight: FontWeight.w600,
            )),
      ))
    
      
      ]));
}
