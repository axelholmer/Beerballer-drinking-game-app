import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/SizeConfig.dart';

//TODO Sätt width pa containers

class InfoPage extends StatelessWidget {
  // InfoPage({}) : super(key: ObjectKey(q));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
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
                  child: Image.asset("./assets/images/Infopage/logowhite.png",
                      // width: SizeConfig.blockSizeHorizontal * 140,
                      // height: SizeConfig.blockSizeVertical * 80,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      colorBlendMode: BlendMode.modulate),
                )),
            SizedBox(height: SizeConfig.blockSizeVertical * 20),
            Container(
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
                "Wir sind ein junges Startup aus Darmstadt,\ndie selbst bei jeder Gelegenheit gerne Beer\nPong spielen. Aus der Begeisterung (und\nvielleicht dem ein oder anderen Getränk zu\nviel..) kam uns die Idee für BeerBaller:\nEine innovative Marke im Bereich\nTrinkspiele mit der wir all unsere kreativen\nIdeen verwirklichen können!",
                textAlign: TextAlign.start,
                maxLines: 8,
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
                "Mit unseren Produkten und Events wollen\nwir Spaß und gute Laune in die\nGesellschaft bringen!",
                textAlign: TextAlign.start,
                maxLines: 3,
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
                "Wir waren ziemlich unzufrieden mit\nden bisherigen Trinkspiel Apps auf dem Markt:",
                textAlign: TextAlign.start,
                maxLines: 3,
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
                              "./assets/images/Infopage/crossIcon.png",

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
                            "...",
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
                    SizedBox(height: SizeConfig.blockSizeVertical * 10),
                    Container(
                        height: SizeConfig.safeBlockVertical * 80,
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
                child: Column(children: [
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
                          "Bei uns bekommt ihr eine Sammlung\naus über 50 Trinkspielen, die ihr mit\ndem Handy oder wenig Material schnell\numsetzen könnt.",
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          style: TextStyle(
                              //fontSize: SizeConfig.safeBlockHorizontal * 50,
                              color: Color.fromRGBO(232, 232, 232, 1),
                              height: SizeConfig.safeBlockVertical * 2.5,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ])),

            SizedBox(height: SizeConfig.blockSizeVertical * 10),
            Container(
                height: SizeConfig.safeBlockVertical * 80,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Und das beste: Sie ist zu 100% kostenlos!",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        //fontSize: SizeConfig.safeBlockHorizontal * 50,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w800),
                  ),
                )),
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
            Image.asset("./assets/images/Infopage/models.jpg"
                // width: SizeConfig.blockSizeHorizontal * 140,
                // height: SizeConfig.blockSizeVertical * 80,
                ),
            SizedBox(height: SizeConfig.blockSizeVertical * 30),
            Container(
              // height: SizeConfig.safeBlockVertical *300,
              width: SizeConfig.safeBlockHorizontal * 85,

              child: Text(
                "Die App war doch deutlich mehr Arbeit als\nanfangs gedacht:)\nWir hoffen sehr, dass sie euch gefällt!",
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                    //fontSize: SizeConfig.safeBlockHorizontal * 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    height: SizeConfig.safeBlockVertical * 2.5,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
            Container(
              // height: SizeConfig.safeBlockVertical *300,
              width: SizeConfig.safeBlockHorizontal * 85,
              child: Text(
                "Wenn ihr uns unterstützen möchtet noch\nweitere Trinkspiele in diese App zu\nintegrieren, würden wir uns riesig über\neine Bewertung im Appstore oder\nGoogle Play store freuen!",
                textAlign: TextAlign.start,
                maxLines: 5,
                style: TextStyle(
                    //fontSize: SizeConfig.safeBlockHorizontal * 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    height: SizeConfig.safeBlockVertical * 2.5,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
            Container(
                height: SizeConfig.safeBlockVertical * 80,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Lasst uns in Kontakt bleiben!",
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
                "Folgt uns gerne auf Instagram und bleibt\nimmer auf dem neuesten Stand über unsere\neuesten Produktideen und anstehende\Events.",
                textAlign: TextAlign.start,
                maxLines: 4,
                style: TextStyle(
                    //fontSize: SizeConfig.safeBlockHorizontal * 50,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    height: SizeConfig.safeBlockVertical * 2.5,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
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
            SizedBox(height: SizeConfig.blockSizeVertical * 10),
          ],
        )))));
  }
}