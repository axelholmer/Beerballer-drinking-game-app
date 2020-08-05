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
      height: SizeConfig.blockSizeVertical * 72,
      width: SizeConfig.blockSizeHorizontal * 200, //Here Cardsize
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
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),

                child: Image.asset(gameClass.imagePath,
                    height: SizeConfig.blockSizeVertical * 30,
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

              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: SizeConfig.blockSizeVertical * 8,
                        width: SizeConfig.blockSizeHorizontal * 40,
                        child: Column(children: <Widget>[
                          Icon(Icons.group,
                              size: SizeConfig.safeBlockHorizontal * 7.5,
                              color: Theme.of(context).accentColor),
                          Text(
                            gameClass.playerNumber,
                            style: TextStyle(
                                color: Color.fromRGBO(238, 237, 237, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                height: SizeConfig.safeBlockVertical * 0.25),
                          )
                        ])),
                    Container(
                        height: SizeConfig.blockSizeVertical * 8,
                        width: SizeConfig.blockSizeHorizontal * 40,
                        child: Column(children: <Widget>[
                          Icon(Icons.access_time,
                              size: SizeConfig.safeBlockHorizontal * 7.5,
                              color: Theme.of(context).accentColor),
                          Text(
                            gameClass.gameDuration,
                            style: TextStyle(
                                color: Color.fromRGBO(238, 237, 237, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                height: SizeConfig.safeBlockVertical * 0.25),
                          ),
                        ]))
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Materials:",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800,
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                                height: SizeConfig.safeBlockVertical * 0.25,
                              )),
                          Container(
                              // height: SizeConfig.blockSizeVertical * 10,
                              width: SizeConfig.blockSizeHorizontal * 90,
                              child: AutoSizeText(
                                gameClass.materials,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.fromRGBO(238, 237, 237, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.5,
                                  height: SizeConfig.blockSizeVertical * 0.15,
                                ),
                              )),
                        ])
                  ]),

              // SizedBox(
              //   height: SizeConfig.blockSizeVertical * 0.5,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    
                      width: SizeConfig.blockSizeHorizontal * 40,
                      height: SizeConfig.blockSizeVertical * 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Betrinkskala",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            ),
                          ),
                          customProgressBar(gameClass.drunknessFactor),
                        ],
                      )),
                  Column(
                    children: <Widget>[
                      Text("Spaßfaktor",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                          )),
                      customProgressBar(gameClass.funFactor),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Dirty Faktor",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                          )),
                      customProgressBar(gameClass.dirtyFactor),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Komplexität",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                          )),
                      customProgressBar(gameClass.difficulty),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              Align(
                child: RaisedButton(
                  color: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => customPopupDialog(
                          context,
                          gameClass.gameName,
                          gameClass.explanationList),
                    );
                  },
                  child: Container(
                    //
                    child: Text(
                      "So funktionierts!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
