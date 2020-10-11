import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/TruthOrDareSwipePage.dart';
import 'package:testflutter/TypeOfQuestion.dart';
import '../SizeConfig.dart';

Widget CustomCardTextTruthOrDare(
    BuildContext context, CardToogle onCardToogle) {
  return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
            child: InkWell(
                onTap: () {
                onCardToogle(TypeOfQuestion.truth);
                },
                child: Container(
                    child: FractionallySizedBox(
                        heightFactor: 1.25,
                        widthFactor: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: FractionallySizedBox(
                                  widthFactor: 1,
                                  heightFactor: 0.5,
                                  child: Image.asset(
                                    "./assets/images/IconsInGame/trueIcon.jpg",
                                    // width: SizeConfig.blockSizeHorizontal * 190,
                                    // height: SizeConfig.blockSizeVertical * 125,
                                    //width: SizeConfig.blockSizeHorizontal * ,
                                    //   height: SizeConfig.blockSizeVertical * 8,
                                  )),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 40,
                            ),
                            Flexible(
                                flex: 3,
                                child: FractionallySizedBox(
                                    widthFactor: 0.35,
                                    heightFactor: 0.8,
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "W\na\nh\nr\nh\ne\ni\nt",
                                          textAlign: TextAlign.center,
                                          maxLines: 8,
                                          //textDirection: Textdirection.
                                          style: TextStyle(
                                            //  fontSize: SizeConfig.safeBlockHorizontal * 7,
                                            // height: SizeConfig.safeBlockVertical * 2,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    1.5,
                                            //fontFamily: 'Oswald',

                                            fontWeight: FontWeight.w700,
                                          ),
                                        ))))
                          ],
                        )),
                    decoration: const BoxDecoration(
                        border: Border(
                      right: BorderSide(width: 1.5, color: Color(0xFFFF000000)),
                    ))))),
        Flexible(
          child: InkWell(
              onTap: () {
                onCardToogle(TypeOfQuestion.dare);
              },
              child: Container(
                child: FractionallySizedBox(
                    heightFactor: 1.25,
                    widthFactor: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: FractionallySizedBox(
                              widthFactor: 1,
                              heightFactor: 0.5,
                              child: Image.asset(
                                "./assets/images/IconsInGame/dareIcon.jpg",
                                // width: SizeConfig.blockSizeHorizontal * 190,
                                // height: SizeConfig.blockSizeVertical * 125,
                                //width: SizeConfig.blockSizeHorizontal * ,
                                //   height: SizeConfig.blockSizeVertical * 8,
                              )),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 40,
                        ),
                        Flexible(
                            flex: 3,
                            child: FractionallySizedBox(
                                widthFactor: 1,
                                heightFactor: 0.8,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "P\nf\nl\ni\nh\nc\nt\n\ ",
                                      textAlign: TextAlign.center,
                                      maxLines: 8,
                                      //textDirection: Textdirection.
                                      style: TextStyle(
                                        //  fontSize: SizeConfig.safeBlockHorizontal * 7,
                                        // height: SizeConfig.safeBlockVertical * 2,
                                        height:
                                            SizeConfig.safeBlockVertical * 1.5,
                                        //fontFamily: 'Oswald',

                                        fontWeight: FontWeight.w700,
                                      ),
                                    ))))
                      ],
                    )),
              )),
        )
      ]);
}
