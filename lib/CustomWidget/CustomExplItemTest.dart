import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../SizeConfig.dart';

Widget CustomExplItemTest(BuildContext context, String text, String number) {
  return Container(
      //height: SizeConfig.blockSizeVertical * 200,
      //width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              //width: 200
              // height: SizeConfig.blockSizeVertical * 80,
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                  2.5), //I used some padding without fixed width and height
              decoration: new BoxDecoration(
                border: Border.all(
                    width: SizeConfig.safeBlockHorizontal * 0.25,
                    color: Theme.of(context).accentColor,
                    style: BorderStyle.solid),

                shape: BoxShape
                    .circle, // You can use like this way or like the below line
                //borderRadius: new BorderRadius.circular(30.0),
                color: Theme.of(context).primaryColor,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: new Text(number,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Theme.of(context).accentColor,
                        //   fontSize: 50.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto")),
              ), //............
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal* 35),
          Flexible(
            flex: 5,
            // width: SizeConfig.blockSizeHorizontal * 470,
            child: Text(text,
                textAlign: TextAlign.start,
                style: new TextStyle(
                    // color: Theme.of(context).accentColor,
                    color: Color.fromRGBO(238, 237, 237, 1),
                    //   fontSize: 50.0,
                    fontWeight: FontWeight.w300,
                    height: SizeConfig.safeBlockHorizontal * 0.4,
                    fontSize: SizeConfig.safeBlockHorizontal * 4)),
          ),
        ],
      )
      //overflow: Overflow.visible,

      );
}
