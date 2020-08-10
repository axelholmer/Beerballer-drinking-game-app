import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/customPopupDialog.dart';
import 'package:testflutter/CustomWidget/customProgressbar.dart';
import 'package:testflutter/SizeConfig.dart';
import '../GameClass.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GameCustomListItem extends StatelessWidget {
  const GameCustomListItem(BuildContext context, {this.gameClass
      // this.thumbnail,
      // this.title,
      // this.user,
      // this.viewCount,
      });
  final GameClass gameClass;

  // final Widget thumbnail;
  // final String title;
  // final String user;
  // final int viewCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 700,
      // width: SizeConfig.blockSizeHorizontal * 200, //Here Cardsize
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        color: Color.fromRGBO(50, 50, 50, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // FlutterLogo(size: 200),

              Flexible(
                flex: 8,
                child: FractionallySizedBox(
                    // widthFactor: 0.3,
                    heightFactor: 1,
                    child: Stack(
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.asset(gameClass.imagePath,
                                // height: SizeConfig.blockSizeVertical * 30,
                                fit: BoxFit.fill),
                            // Container(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Text(
                            //     gameClass.gameName,
                            //     style: TextStyle(
                            //       color: Theme.of(context).accentColor,
                            //       fontWeight: FontWeight.w800,
                            //       fontSize: SizeConfig.safeBlockHorizontal * 9,
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: FractionallySizedBox(
                                widthFactor: 1,
                                heightFactor: 0.35,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 50),
                                    Flexible(
                                        child: FractionallySizedBox(
                                            widthFactor: 1,
                                            heightFactor: 1,
                                            child: FittedBox(
                                                alignment: Alignment.centerLeft,
                                                fit: BoxFit.contain,
                                                child: AutoSizeText(
                                                  gameClass.gameName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        250, 250, 250, 1),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ))))
                                  ],
                                )))
                      ],
                    )),
              ),

              SizedBox(height: SizeConfig.blockSizeVertical * 20),

//First Icon row
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  //  widthFactor: 0.2,
                  heightFactor: 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 1,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                  child: FractionallySizedBox(
                                      widthFactor: 1,
                                      heightFactor: 1.6,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Icon(Icons.group,
                                            // size: SizeConfig.safeBlockHorizontal *
                                            //     7.5,
                                            color:
                                                Theme.of(context).accentColor),
                                      )),
                                ),
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 20),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 1,
                                        heightFactor: 2,
                                        child: FittedBox(
                                            // alignment: Alignment.centerLeft,
                                            fit: BoxFit.contain,
                                            child: Text(
                                              gameClass.playerNumber,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 237, 237, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))))
                              ]))),
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 1,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                    child: FractionallySizedBox(
                                  widthFactor: 1,
                                  heightFactor: 1.6,
                                  child: FittedBox(
                                    // alignment: Alignment.centerLeft,
                                    fit: BoxFit.contain,
                                    child: Icon(Icons.access_time,
                                        // size: SizeConfig.safeBlockHorizontal *
                                        //     7.5,
                                        color: Theme.of(context).accentColor),
                                  ),
                                )),
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical * 20),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 1,
                                        heightFactor: 2,
                                        child: FittedBox(
                                            // alignment: Alignment.centerLeft,
                                            fit: BoxFit.contain,
                                            child: Text(
                                              gameClass.gameDuration,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    238, 237, 237, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))))
                              ]))),
                    ],
                  ),
                ),
              ),
//Materials
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  //  widthFactor: 0.2,
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 2,
                              heightFactor: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical * 7),
                                    Flexible(
                                        child: FractionallySizedBox(
                                      widthFactor: 1,
                                      heightFactor: 1.75,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text("Materialen:",
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w800,
                                              // fontSize:
                                              //     SizeConfig.safeBlockHorizontal *
                                              //         4.5,
                                              // height: SizeConfig.safeBlockVertical *
                                              //     0.25,
                                            )),
                                      ),
                                    )),
                                    Flexible(
                                        child: FractionallySizedBox(
                                      widthFactor: 2,
                                      heightFactor: 1.35,
                                      child: FittedBox(
                                          // alignment: Alignment.centerLeft,
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            gameClass.materials,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 237, 237, 1),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ))
                                  ]))),
                    ],
                  ),
                ),
              ),

//Drunkness & Funfactor
              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  //  widthFactor: 0.2,
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 2,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                  child: FractionallySizedBox(
                                      widthFactor: 0.6,
                                      heightFactor: 1.5,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "Betrinkskala",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      )),
                                ),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.8,
                                        child: FittedBox(
                                          // alignment: Alignment.centerLeft,
                                          fit: BoxFit.contain,
                                          child: customProgressBar(
                                              gameClass.drunknessFactor),
                                        )))
                              ]))),
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 2,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                  child: FractionallySizedBox(
                                      widthFactor: 0.6,
                                      heightFactor: 1.5,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "Spaßfaktor",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      )),
                                ),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.8,
                                        child: FittedBox(
                                          // alignment: Alignment.centerLeft,
                                          fit: BoxFit.contain,
                                          child: customProgressBar(
                                              gameClass.funFactor),
                                        )))
                              ]))),
                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 2,
                child: FractionallySizedBox(
                  //  widthFactor: 0.2,
                  heightFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 2,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                  child: FractionallySizedBox(
                                      widthFactor: 0.6,
                                      heightFactor: 1.5,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "Dirty Faktor",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      )),
                                ),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.8,
                                        child: FittedBox(
                                          // alignment: Alignment.centerLeft,
                                          fit: BoxFit.contain,
                                          child: customProgressBar(
                                              gameClass.dirtyFactor),
                                        )))
                              ]))),
                      Flexible(
                          child: FractionallySizedBox(
                              widthFactor: 2,
                              heightFactor: 1,
                              child: Column(children: <Widget>[
                                Flexible(
                                  child: FractionallySizedBox(
                                      widthFactor: 0.6,
                                      heightFactor: 1.5,
                                      child: FittedBox(
                                        // alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "Komplexität",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      )),
                                ),
                                Flexible(
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.8,
                                        child: FittedBox(
                                          // alignment: Alignment.centerLeft,
                                          fit: BoxFit.contain,
                                          child: customProgressBar(
                                              gameClass.difficulty),
                                        )))
                              ]))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 10),
              Flexible(
                  flex: 2,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.8,
                    child: RaisedButton(
                      color: Colors.yellow[600],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => customPopupDialog(
                              context,
                              gameClass.gameName,
                              gameClass.explanationList),
                        );
                      },
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 1.1,
                        child: FittedBox(
                          // alignment: Alignment.centerLeft,
                          fit: BoxFit.contain,
                          child: Text(
                            "So funktionierts!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
