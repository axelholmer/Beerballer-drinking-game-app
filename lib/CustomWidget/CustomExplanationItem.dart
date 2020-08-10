import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../SizeConfig.dart';

Widget CustomExplanationItem(BuildContext context) {
  return Container(
      height: SizeConfig.blockSizeVertical * 200,
      child: Stack(
        children: [
          // Align(
          //     alignment: Alignment.topLeft,
          //     child: Container(
          //         width: SizeConfig.blockSizeHorizontal * 100,
          //        //height: SizeConfig.blockSizeVertical *100,
          //       padding: EdgeInsets.all(SizeConfig
          //               .safeBlockHorizontal *
          //           3), //I used some padding without fixed width and height
          //       decoration: new BoxDecoration(
          //         border: Border.all(
          //             width: SizeConfig.safeBlockHorizontal * 0.35,
          //             color: Theme.of(context).accentColor,
          //             style: BorderStyle.solid),

          //         shape: BoxShape
          //             .circle, // You can use like this way or like the below line
          //         //borderRadius: new BorderRadius.circular(30.0),
          //         color: Theme.of(context).primaryColor,
          //       ),
          //       child: FittedBox(
          //         fit: BoxFit.contain,
          //         child: new Text("1",
          //             textAlign: TextAlign.center,
          //             style: new TextStyle(
          //                 color: Theme.of(context).accentColor,
          //                 //   fontSize: 50.0,
          //                 fontWeight: FontWeight.w400,
          //                 fontFamily: "Roboto")),
          //         // You can add a Icon instead of text also, like below.
          //         //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
          //       ), //............
          //     )),

          // Align(
          //     alignment: Alignment.centerRight,
          //     child: Container(
          //       width: SizeConfig.blockSizeHorizontal * 700,
          //         child: Text(
          //             "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblabla",
          //             textAlign: TextAlign.start,
          //             style: new TextStyle(
          //               color: Theme.of(context).accentColor,
          //               //   fontSize: 50.0,
          //               fontWeight: FontWeight.w400,
          //             ))))

          Align(
            alignment: Alignment.topLeft,
            child: FractionallySizedBox(
                widthFactor: 0.2,
                heightFactor: 0.3,
                child: Container(
                  // width: 200.0,
                  // height: 200.0,
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                      1.5), //I used some padding without fixed width and height
                  decoration: new BoxDecoration(
                    border: Border.all(
                        width: SizeConfig.safeBlockHorizontal * 0.35,
                        color: Theme.of(context).accentColor,
                        style: BorderStyle.solid),

                    shape: BoxShape
                        .circle, // You can use like this way or like the below line
                    //borderRadius: new BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: new Text("1",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Theme.of(context).accentColor,
                            //   fontSize: 50.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto")),
                    // You can add a Icon instead of text also, like below.
                    //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
                  ), //............
                )),
          ),

          // Align(
          //     alignment: Alignment.center,
          //     child: Text(
          //         "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbblabla",
          //         textAlign: TextAlign.start,
          //         style: new TextStyle(
          //           color: Theme.of(context).accentColor,
          //           //   fontSize: 50.0,
          //           fontWeight: FontWeight.w400,
          //         ))),

          Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                  widthFactor: 0.75,
                  heightFactor: 1,
                  child: FittedBox(
                      child: new Text("blabla",
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            color: Theme.of(context).accentColor,
                            //   fontSize: 50.0,
                            fontWeight: FontWeight.w400,
                          )))))
        ],
      ));
}
