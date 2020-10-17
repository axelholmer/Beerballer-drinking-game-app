import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/CustomTopTitleScreen2.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/CustomTopTitleWidgetInfoPage.dart';

//TODO Sätt width pa containers

class InfoPage extends StatelessWidget {
  // InfoPage({}) : super(key: ObjectKey(q));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            child: Stack(
                //  alignment: Alignment.center,
                children: [
              SafeArea(
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Column(
                children: [
                  Image.asset("./assets/images/Infopage/groupPic.jpg"
                      // width: SizeConfig.blockSizeHorizontal * 140,
                      // height: SizeConfig.blockSizeVertical * 80,
                      ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 40),
                  Container(
                      height: SizeConfig.safeBlockVertical * 250,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "\"Team BeerBaller\nwünscht viel Spaß beim\n Trinkspiel Abend!\"",
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 30),
                  Container(
                      height: SizeConfig.safeBlockVertical * 200,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 1, minHeight: 1), // here
                            child: Image.asset(
                                "./assets/images/Infopage/logowhite.png",
                                // width: SizeConfig.blockSizeHorizontal * 140,
                                // height: SizeConfig.blockSizeVertical * 80,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                colorBlendMode: BlendMode.modulate),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 20),

                  InkWell(
                      child: Container(
                          height: SizeConfig.safeBlockVertical * 80,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "www.beerballer.com",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                    color: Color.fromRGBO(235, 235, 235, 1),
                                    fontWeight: FontWeight.w400),
                              ))),
                      onTap: () async {
                        await launch("https://beerballer.com/");
                      }),

                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Wer sind wir?",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "Wir sind ein junges Startup aus Darmstadt, die selbst bei jeder Gelegenheit gerne Beer Pong spielen. Aus dieser Begeisterung (und vllt dem ein oder anderen Getränk zu viel..) kam uns die Idee für BeerBaller: Eine innovative Marke im Bereich Trinkspiele mit der wir unsere kreativen Ideen verwirklichen können!",
                      textAlign: TextAlign.start,
                      // maxLines: 8,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  // Container(
                  //     // height: SizeConfig.safeBlockVertical *300,
                  //     width: SizeConfig.safeBlockHorizontal * 85,
                  //     child: FittedBox(
                  //       alignment: Alignment.topCenter,
                  //       fit: BoxFit.contain,
                  //       child: Text(
                  //         "Wir sind ein junges Startup aus Darmstadt,\ndie selbst bei jeder Gelegenheit gerne Beer\nPong spielen. Aus der Begeisterung (und\nvielleicht dem ein oder anderen Getränk zu\nviel..) kam uns die Idee für BeerBaller:\nEine innovative Marke im Bereich\nTrinkspiele mit der wir all unsere kreativen\nIdeen verwirklichen können!",
                  //         textAlign: TextAlign.start,
                  //         maxLines: 8,
                  //         style: TextStyle(
                  //             //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //             color: Color.fromRGBO(232, 232, 232, 1),
                  //             height: SizeConfig.safeBlockVertical * 2.3,
                  //             fontWeight: FontWeight.w300),
                  //       ),
                  //     )),

                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Unsere Vision",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),

                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,

                    child: Text(
                      // "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                      "Mit unseren Produkten und Events wollen wir Spaß und gute Laune in die Gesellschaft bringen!",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  // Container(
                  //     // height: SizeConfig.safeBlockVertical *300,
                  //     width: SizeConfig.safeBlockHorizontal * 85,
                  //     child: FittedBox(
                  //       alignment: Alignment.topCenter,
                  //       fit: BoxFit.contain,
                  //       child: Text(
                  //         "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                  //         textAlign: TextAlign.start,
                  //         maxLines: 3,
                  //         style: TextStyle(
                  //             //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //             color: Color.fromRGBO(232, 232, 232, 1),
                  //             height: SizeConfig.safeBlockVertical * 2.3,
                  //             fontWeight: FontWeight.w300),
                  //       ),
                  //     )),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Image.asset("./assets/images/Infopage/teamBildTische.jpg"
                      // width: SizeConfig.blockSizeHorizontal * 140,
                      // height: SizeConfig.blockSizeVertical * 80,
                      ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Warum diese App?",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              //fontSize: SizeConfig.safeBlockHorizontal * 50,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w800),
                        ),
                      )),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),

                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      // "Wir waren ziemlich unzufrieden mit\nden bisherigen Trinkspiel Apps auf dem Markt:",
                      "Wir waren ziemlich unzufrieden mit den bisherigen Trinkspiel Apps auf dem Markt:",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                      // height: SizeConfig.safeBlockVertical *300,
                      width: SizeConfig.safeBlockHorizontal * 85,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minWidth: 1,
                                              minHeight: 1), // here
                                          child: Image.asset(
                                              "./assets/images/Infopage/crossIcon.png"
                                              // width: SizeConfig.blockSizeHorizontal * 140,
                                              // height: SizeConfig.blockSizeVertical * 80,
                                              ),
                                        )),
                                  )),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "0815 Spiele",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      // height: SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height

                                    child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                      "./assets/images/Infopage/crossIcon.png"
                                      // width: SizeConfig.blockSizeHorizontal * 140,
                                      // height: SizeConfig.blockSizeVertical * 80,
                                      ),
                                )),
                              ),
                              // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "Für jedes Trinkspiel eine neue App downloaden",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      // height: SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height

                                    child: FittedBox(
                                  //alignment: Alignment,
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                      "./assets/images/Infopage/crossIcon.png"
                                      // width: SizeConfig.blockSizeHorizontal * 140,
                                      // height: SizeConfig.blockSizeVertical * 80,
                                      ),
                                )),
                              ),
                              // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "Zahlungspflichtige Spielerweiterungen",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      // height: SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Flexible(
                          //       flex: 1,
                          //       child: Container(
                          //           //width: 200
                          //           // height: SizeConfig.blockSizeVertical * 80,
                          //           // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                          //           //     2.5), //I used some padding without fixed width and height

                          //           child: FittedBox(
                          //         fit: BoxFit.contain,
                          //         child: Image.asset(
                          //           "./assets/images/Infopage/crossIcon.png",

                          //           // width: SizeConfig.blockSizeHorizontal * 140,
                          //           // height: SizeConfig.blockSizeVertical * 80,
                          //         ),
                          //       )),
                          //     ),
                          //     // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                          //     Flexible(
                          //       flex: 5,
                          //       // width: SizeConfig.blockSizeHorizontal * 470,
                          //       child: Text(
                          //         "...",
                          //         textAlign: TextAlign.center,
                          //         maxLines: 1,
                          //         style: TextStyle(
                          //             //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          //             color: Color.fromRGBO(232, 232, 232, 1),
                          //             // height: SizeConfig.safeBlockVertical * 2.5,
                          //             fontWeight: FontWeight.w300),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 10),
                          Container(
                              height: SizeConfig.safeBlockVertical * 80,
                              width: SizeConfig.safeBlockHorizontal * 82,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Da dachten wir, dass können wir besser!",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w800),
                                ),
                              )),
                        ],
                      )),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      // height: SizeConfig.safeBlockVertical *300,
                      width: SizeConfig.safeBlockHorizontal * 85,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minWidth: 1,
                                              minHeight: 1), // here
                                          child: Image.asset(
                                              "./assets/images/Infopage/checkIcon.png"
                                              // width: SizeConfig.blockSizeHorizontal * 140,
                                              // height: SizeConfig.blockSizeVertical * 80,
                                              ),
                                        )),
                                  )),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "Über 50 Spiele in einer App",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      // height: SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height

                                    child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                      "./assets/images/Infopage/checkIcon.png"
                                      // width: SizeConfig.blockSizeHorizontal * 140,
                                      // height: SizeConfig.blockSizeVertical * 80,
                                      ),
                                )),
                              ),
                              // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "Lustig & abwechslungsreiche Aufgaben",
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      height:
                                          SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                    //width: 200
                                    // height: SizeConfig.blockSizeVertical * 80,
                                    // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                                    //     2.5), //I used some padding without fixed width and height

                                    child: FittedBox(
                                  //alignment: Alignment,
                                  fit: BoxFit.contain,
                                  child: Image.asset(
                                      "./assets/images/Infopage/checkIcon.png"
                                      // width: SizeConfig.blockSizeHorizontal * 140,
                                      // height: SizeConfig.blockSizeVertical * 80,
                                      ),
                                )),
                              ),
                              // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                              Flexible(
                                flex: 5,
                                // width: SizeConfig.blockSizeHorizontal * 470,
                                child: Text(
                                  "100% Kostenlos",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                      //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                      color: Color.fromRGBO(232, 232, 232, 1),
                                      // height: SizeConfig.safeBlockVertical * 2.5,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),

                  // Container(
                  //     // height: SizeConfig.safeBlockVertical *300,
                  //     width: SizeConfig.safeBlockHorizontal * 85,
                  //     child: Column(children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Flexible(
                  //             flex: 1,
                  //             child: Container(
                  //                 //width: 200
                  //                 // height: SizeConfig.blockSizeVertical * 80,
                  //                 // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal *
                  //                 //     2.5), //I used some padding without fixed width and height

                  //                 child: FittedBox(
                  //               fit: BoxFit.contain,
                  //               child: Image.asset(
                  //                   "./assets/images/Infopage/checkIcon.png"
                  //                   // width: SizeConfig.blockSizeHorizontal * 140,
                  //                   // height: SizeConfig.blockSizeVertical * 80,
                  //                   ),
                  //             )),
                  //           ),
                  //           // SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                  //           Flexible(
                  //             flex: 5,
                  //             // width: SizeConfig.blockSizeHorizontal * 470,
                  //             child: Text(
                  //               // "Bei uns bekommt ihr eine Sammlung\naus über 50 Trinkspielen, die ihr mit\ndem Handy oder wenig Material schnell\numsetzen könnt.",
                  //               "Bei uns bekommt ihr eine Sammlung aus über 50 Trinkspielen, die ihr mit dem Handy oder wenig Material schnell umsetzen könnt.",
                  //               textAlign: TextAlign.start,
                  //               // maxLines: 4,
                  //               style: TextStyle(
                  //                   //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //                   color: Color.fromRGBO(232, 232, 232, 1),
                  //                   height: SizeConfig.safeBlockVertical * 2.5,
                  //                   fontWeight: FontWeight.w300),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ])),

                  // SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  // Container(
                  //     height: SizeConfig.safeBlockVertical * 80,
                  //     child: FittedBox(
                  //       fit: BoxFit.contain,
                  //       child: Text(
                  //         "Und das beste: Sie ist zu 100% kostenlos!",
                  //         textAlign: TextAlign.center,
                  //         maxLines: 1,
                  //         style: TextStyle(
                  //             //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //             color: Theme.of(context).accentColor,
                  //             fontWeight: FontWeight.w800),
                  //       ),
                  //     )),

                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      height: SizeConfig.safeBlockVertical * 120,
                      width: SizeConfig.safeBlockHorizontal * 80,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Ihr kennt ein Spiel,\ndas unbedingt noch in die App sollte?!",
                          textAlign: TextAlign.center,
                          // maxLines: 2,
                          style: TextStyle(
                              //fontSize: SizeConfig.safeBlockHorizontal * 50,
                              color: Theme.of(context).accentColor,
                              height: SizeConfig.safeBlockVertical * 2.5,
                              fontWeight: FontWeight.w800),
                        ),
                      )),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),

                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      // "Folgt uns gerne auf Instagram und bleibt\nimmer auf dem neuesten Stand über unsere\neuesten Produktideen und anstehende\Events.",
                      "Dann schreibt uns gerne eine Nachricht auf Instagram mit eurer Trinkspiel Idee und wir versuchen diese noch in die App zu integrieren ;-)",
                      textAlign: TextAlign.start,
                      // maxLines: 4,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Euch gefällt die App?",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),

                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,

                    child: Text(
                      // "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                      "Wir würden uns riesig über eine Bewertung im App/Googleplay Store freuen!!",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Image.asset("./assets/images/Infopage/models.jpg"
                      // width: SizeConfig.blockSizeHorizontal * 140,
                      // height: SizeConfig.blockSizeVertical * 80,
                      ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 30),

                  // Container(
                  //   // height: SizeConfig.safeBlockVertical *300,
                  //   width: SizeConfig.safeBlockHorizontal * 85,

                  //   child: Text(
                  //     // "Die App war doch deutlich mehr Arbeit als\anfangs gedacht:)\nWir hoffen sehr, dass sie euch gefällt!",
                  //     "Die App war doch deutlich mehr Arbeit als anfangs gedacht:) Wir hoffen sehr, dass sie euch gefällt!",
                  //     textAlign: TextAlign.start,
                  //     // maxLines: 3,
                  //     style: TextStyle(
                  //         //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //         color: Color.fromRGBO(232, 232, 232, 1),
                  //         height: SizeConfig.safeBlockVertical * 2.5,
                  //         fontWeight: FontWeight.w300),
                  //   ),
                  // ),
                  // SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  // Container(
                  //   // height: SizeConfig.safeBlockVertical *300,
                  //   width: SizeConfig.safeBlockHorizontal * 85,
                  //   child: Text(
                  //     // "Wenn ihr uns unterstützen möchtet noch\nweitere Trinkspiele in diese App zu\nintegrieren, würden wir uns riesig über\neine Bewertung im Appstore oder\nGoogle Play store freuen!",
                  //     "Wenn ihr uns unterstützen möchtet noch weitere Trinkspiele in diese App zu integrieren, würden wir uns riesig über eine Bewertung im Appstore oder Google Play store freuen!",
                  //     textAlign: TextAlign.start,
                  //     // maxLines: 5,
                  //     style: TextStyle(
                  //         //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //         color: Color.fromRGBO(232, 232, 232, 1),
                  //         height: SizeConfig.safeBlockVertical * 2.5,
                  //         fontWeight: FontWeight.w300),
                  //   ),
                  // ),
                  // SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  // Container(
                  //     height: SizeConfig.safeBlockVertical * 80,
                  //     child: FittedBox(
                  //         fit: BoxFit.contain,
                  //         child: Text(
                  //           "Lasst uns in Kontakt bleiben!",
                  //           textAlign: TextAlign.center,
                  //           maxLines: 1,
                  //           style: TextStyle(
                  //               //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //               color: Theme.of(context).accentColor,
                  //               fontWeight: FontWeight.w800),
                  //         ))),
                  // SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  // Container(
                  //   // height: SizeConfig.safeBlockVertical *300,
                  //   width: SizeConfig.safeBlockHorizontal * 85,
                  //   child: Text(
                  //     // "Folgt uns gerne auf Instagram und bleibt\nimmer auf dem neuesten Stand über unsere\neuesten Produktideen und anstehende\Events.",
                  //     "Folgt uns gerne auf Instagram und bleibt immer auf dem neuesten Stand über unsere euesten Produktideen und anstehende events.",
                  //     textAlign: TextAlign.start,
                  //     // maxLines: 4,
                  //     style: TextStyle(
                  //         //fontSize: SizeConfig.safeBlockHorizontal * 50,
                  //         color: Color.fromRGBO(232, 232, 232, 1),
                  //         height: SizeConfig.safeBlockVertical * 2.5,
                  //         fontWeight: FontWeight.w300),
                  //   ),
                  // ),
                  // SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Impressum:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "BeerBaller GmbH\nSpessartring 8\n64287 Darmstadt\nsupport@beerballer.com",
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

//"Haftungsausschluss:
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Haftungsausschluss:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      // "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                      "BeerBaller übernimmt keinerlei Verantwortung für Konsequenzen, welche aus der Nutzung der BeerBaller App resultieren können. Haftungsansprüche gegen BeerBaller, die sich auf Schäden psychischer, physischer, materieller und ideeller Art beziehen, die durch die Nutzung oder Nichtnutzung der angebotenen Informationen, bzw. der Inhalte verursacht wurden, sind grundsätzlich ausgeschlossen. BeerBaller weist auf eine verantwortungsvollen Umgang mit Alkohol hin und so liegt alle Verantwortung auf dem/den Nutzer(n) der App. Ebenso sind alle Inhalte der App lediglich Empfehlungen und keine Aufforderungen, oder Pflichten. Sie sollen weder Minderheiten eingrenzen, noch angreifen. Mit der Bestätigung der Kenntnisnahme des Warnhinweises akzeptiert der Nutzer die oben genannten Punkte und entbindet BeerBaller jeglicher Haftbarkeit.",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),



//Streitschlichtung:
                   SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Streitschlichtung:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      // "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                      "Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: https://ec.europa.eu/consumers/odr. Unsere E-Mail-Adresse finden Sie oben im Impressum.Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                  //Haftung für Inhalte::
                   SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Haftung für Inhalte:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                     //Haftung für Links::
                   SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Haftung für Links:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "Unser Angebot enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.",
                      textAlign: TextAlign.start,
                      // maxLines: 3,
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

 //Urheberrecht:
                   SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Urheberrecht:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.",  
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),

                   //Datenschutzerklärung:
                   SizedBox(height: SizeConfig.blockSizeVertical * 10),
                   Container(
                      height: SizeConfig.safeBlockVertical * 80,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Datenschutzerklärung:",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w800),
                          ))),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  Container(
                    // height: SizeConfig.safeBlockVertical *300,
                    width: SizeConfig.safeBlockHorizontal * 85,
                    child: Text(
                      "Die Datenschutzerklärung kann unter www.beerballer.com/datenschutzerklaerung eingesehen werden.",  
                      style: TextStyle(
                          //fontSize: SizeConfig.safeBlockHorizontal * 50,
                          color: Color.fromRGBO(232, 232, 232, 1),
                          height: SizeConfig.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                ],
              )))),

              




              Column(
                children: <Widget>[
                  SizedBox(
                    //always need this for title screens
                    height: SizeConfig.blockSizeVertical * 35,
                  ),
                  CustomTopTitleWidgetInfoPage(context)
                  //Here customtoptitle.

                  // Container(
                  //   height: SizeConfig.safeBlockVertical * 110,
                  //   width: SizeConfig.screenWidth,
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: FractionallySizedBox(
                  //       widthFactor: 1,
                  //       heightFactor: 0.55,
                  //       child: FittedBox(
                  //         alignment: Alignment.centerLeft,
                  //         fit: BoxFit.contain,
                  //         child: CustomBackButton(context),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )
            ])));
  }
}
