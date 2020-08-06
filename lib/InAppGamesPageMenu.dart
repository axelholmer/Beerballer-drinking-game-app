// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/CategoryGamePage.dart';
import 'package:testflutter/NeverEverHaveIPage.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';

import 'package:testflutter/Questionclasses/QuestionEstimation.dart';
import 'package:testflutter/SchaetzenPage.dart';
import 'package:testflutter/TruthOrDarePage.dart';
import 'package:testflutter/customTransistionAnimation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'SchaetzenPage.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'Player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SizeConfig.dart';
import 'playerMenuPage.dart';
import 'GameChoicheEnum.dart';
import 'main.dart';

//TODO create custom SplashScreen
//Todo put underscore(private) to items
//ctrl och click pa ngt bra genväg

// List<QuestionEstimation> listEstimateQuestions;
// List<TruthOrDareQuestion> listTruDareQuestions;
// List<QuestionNeverHaveI> listNeverEverHAveIquestions;
// List<QuestionCategoryGame> listCategoryQuestions;

// void main() {
//   loadEstimateAsset().then((value) {
//     //TODO look up where you should load assets
//     listEstimateQuestions = value;
//   });

//   runApp(MyApp());
// }

// //Try surround Materialapp with inheritedwidget and update Values over updateShouldNotify
// class InheritedMainWidget extends InheritedWidget {
//   InheritedMainWidget({
//     Key key,
//     this.myLogo,
//     this.listTruDareQuestions,
//     this.listNeverHaveIQuestions,
//     this.listCategoryQuestions,
//     Widget child,
//   }) : super(key: key, child: child);
//   final List<TruthOrDareQuestion> listTruDareQuestions;
//   final List<QuestionNeverHaveI> listNeverHaveIQuestions;
//   final List<QuestionCategoryGame> listCategoryQuestions;
//   final Image myLogo;

//   @override
//   bool updateShouldNotify(InheritedMainWidget old) {
//     return listTruDareQuestions != old.listTruDareQuestions &&
//         myLogo != old.myLogo &&
//         listNeverHaveIQuestions != old.listNeverHaveIQuestions &&
//         listCategoryQuestions != old.listCategoryQuestions;
//   }

//   static InheritedMainWidget of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<InheritedMainWidget>();
//   }
// }

// //Estimate Load
// Future<List<QuestionEstimation>> loadEstimateAsset() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final questionsString =
//       await rootBundle.loadString('./assets/res/textfile.json');

//   return parseEstimateQuestion(questionsString);
// }

// List<QuestionEstimation> parseEstimateQuestion(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<QuestionEstimation>((json) => QuestionEstimation.fromJson(json))
//       .toList();
// }

// //TruDare Load
// Future<List<TruthOrDareQuestion>> loadTruDareAsset() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final questionsString =
//       await rootBundle.loadString('./assets/res/textFileTruDar.json');

//   return parseTruDareQuestion(questionsString);
// }

// List<TruthOrDareQuestion> parseTruDareQuestion(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<TruthOrDareQuestion>((json) => TruthOrDareQuestion.fromJson(json))
//       .toList();
// }

// //NeverHaveI LOad
// Future<List<QuestionNeverHaveI>> loadNeverHaveIAsset() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final questionsString =
//       await rootBundle.loadString('./assets/res/textFileNeverEver.json');

//   return parseNeverHaveIQuestion(questionsString);
// }

// List<QuestionNeverHaveI> parseNeverHaveIQuestion(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<QuestionNeverHaveI>((json) => QuestionNeverHaveI.fromJson(json))
//       .toList();
// }

// //Category Load
// Future<List<QuestionCategoryGame>> loadCategoryAsset() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final questionsString =
//       await rootBundle.loadString('./assets/res/textFileCategoryGame.json');

//   return parseCategoryQuestion(questionsString);
// }

// List<QuestionCategoryGame> parseCategoryQuestion(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<QuestionCategoryGame>((json) => QuestionCategoryGame.fromJson(json))
//       .toList();
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Image myLogo;
//   @override
//   void initState() {
//     // precacheImage(AssetImage("./assets/images/logo.png"), context);
//     // precacheImage(AssetImage("./assets/images/bild1.jpg"), context);
//     myLogo = Image.asset("./assets/images/BeerBallerLogo_kleiner.png");
//     precacheImage(myLogo.image, context);

//     loadTruDareAsset().then((value) {
//       setState(() {
//         listTruDareQuestions = value;
//       });
//     });

//     loadNeverHaveIAsset().then((value) {
//       setState(() {
//         listNeverEverHAveIquestions = value;
//       });
//     });

//     loadCategoryAsset().then((value) {
//       setState(() {
//         listCategoryQuestions = value;
//       });
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     precacheImage(
//         AssetImage("./assets/images/BeerBallerLogo_kleiner.png"), context);
//     // precacheImage(AssetImage("./assets/images/bild1.jpg"), context);
//     return InheritedMainWidget(
//       child: MaterialApp(
//         title: 'Beerballer Trinkspiele',
//         theme: ThemeData(
//             brightness: Brightness.light,
//             primaryColor: Colors.lightBlue[800],
//             accentColor: Colors.orangeAccent[200],
//             fontFamily: 'Oswald'),
//         home: GameMenu(),
//       ),
//       listTruDareQuestions: listTruDareQuestions,
//       listNeverHaveIQuestions: listNeverEverHAveIquestions,
//       listCategoryQuestions: listCategoryQuestions,
//       myLogo: myLogo,
//     );
//   }
// }

class InAppGamesPageMenu extends StatefulWidget {
  @override
  InAppGamesPageMenuState createState() => InAppGamesPageMenuState();
}

class InAppGamesPageMenuState extends State<InAppGamesPageMenu>
    with TickerProviderStateMixin {
  final List<GameChoice> _gameChoices = const <GameChoice>[
    const GameChoice(title: 'Schaetzen', id: GameChoicheEnum.estimate),
    const GameChoice(
        title: 'Wahrheit oder Pflicht',
        id: GameChoicheEnum.wahrheitOderPflicht),
    const GameChoice(
        title: 'Ich habe noch nie', id: GameChoicheEnum.ichHabeNochNie),
    const GameChoice(
        title: 'Kategoriespiel', id: GameChoicheEnum.kategorieSpiel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _gameChoiceWidget(_gameChoices, context),
      bottomNavigationBar: BottomNavigationBarButtons(context),
      floatingActionButton: Customfloatingactionbutton(
          InheritedMainWidget.of(context).myLogo, this),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _gameChoiceWidget(
    final List<GameChoice> gameChoices, BuildContext context) {
  List<Widget> gameChoiceWidgets = [];

  for (var item in gameChoices) {
    //gameChoiceWidgets.add(SizedBox(height: SizeConfig.blockSizeVertical * ));
    gameChoiceWidgets.add(_gameChoiceButton(item, context));
   gameChoiceWidgets.add( Flexible(
        child: FractionallySizedBox(
      heightFactor: 1,
    )));
  }
  //gameChoiceWidgets.add(SizedBox(height: 20));

  return Center(
      //Todo make this text + logo + backbutton its own widget.
      child: Column(children: <Widget>[
    SizedBox(
      height: SizeConfig.blockSizeVertical * 35,
    ),
    Flexible(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.35,
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.contain,
          child: CustomBackButton(context),
        ),
      ),
    ),
    Flexible(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "In App spiele",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontSize: SizeConfig.safeBlockHorizontal * 8,
                          color: Color.fromRGBO(238, 237, 237, 1),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ))),
            Image.asset(
              "./assets/images/inGameAppIcon.png",
              width: SizeConfig.blockSizeHorizontal * 180,
              height: SizeConfig.blockSizeVertical * 100,
              //width: SizeConfig.blockSizeHorizontal * ,
              //   height: SizeConfig.blockSizeVertical * 8,
            ),
          ],
        ),
      ),
    ),
    Flexible(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 2.7,
        child: Column /*or Column*/ (
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: gameChoiceWidgets,
        ),
      ),
    )
  ]));
}

Widget _gameChoiceButton(GameChoice gameChoice, BuildContext context) {
  return Flexible(
      child: RaisedButton(
    color: Theme.of(context).accentColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
        side: BorderSide(
          color: Theme.of(context).accentColor,
        )),
    onPressed: () {
      _selectGameChoice(gameChoice, context);
    },
    child: FractionallySizedBox(
        heightFactor: 0.35,
        widthFactor: 0.80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Flexible(  //Fix box
            //     child: FractionallySizedBox(
            //   widthFactor: 0.4,
            // )),

            SizedBox(
              // height: SizeConfig.blockSizeVertical * 2,
              width: SizeConfig.blockSizeHorizontal * 1,
            ),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 0.9,
              child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: AutoSizeText(
                    gameChoice.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        //fontSize: SizeConfig.safeBlockHorizontal * 50,
                        fontWeight: FontWeight.w700),
                  )),
            )),
            // Text(
            //   gameChoice.item1,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: SizeConfig.safeBlockHorizontal * 50,
            //       fontWeight: FontWeight.w700),
            // ),

            //  Flexible(  //Fix box
            //     child: FractionallySizedBox(
            //   widthFactor: 0.4,
            // )),
            // Container(
            //   height: SizeConfig.blockSizeVertical * 1,
            //   width: SizeConfig.blockSizeHorizontal * 3,
            // ),
          ],
        )),
  ));

  // return  RaisedButton(
  //   color: Theme.of(context).accentColor,
  //   shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(11.0),
  //       side: BorderSide(
  //         color: Theme.of(context).accentColor,
  //       )),
  //   onPressed: () {
  //     _selectGameChoice(gameChoice, context);
  //   },
  //   child: FractionallySizedBox(
  //     widthFactor: 1,
  //     child: FittedBox(
  //         fit: BoxFit.contain,
  //         child: AutoSizeText(
  //           gameChoice.title,
  //           maxLines: 1,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               //  fontSize: SizeConfig.safeBlockHorizontal * 6,
  //               ),
  //         )),
  //   ),
  // );
}

class GameChoice {
  const GameChoice({this.title, this.id});
  final String title;
  final GameChoicheEnum id;
}
//TODO Enum better als string?
// enum UserStatus {
//   notDetermined,
//   notSignedIn,
//   signedIn,
// }
// UserStatus.notDetermined;

void _selectGameChoice(GameChoice choice, BuildContext context) {
  switch (choice.id.index) {
    case 0:
      {
        Navigator.push(
            context,
            CustomTransistionAnimation(
                page: SchaetzenPage(listQuestions: listEstimateQuestions)));
      }
      break;
    case 1:
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: PlayersMenu(
            GameChoicheEnum.wahrheitOderPflicht,
            gamechoicheenum: GameChoicheEnum.wahrheitOderPflicht,
          )));

      break;
    case 2:
      {
        Navigator.push(
            context,
            CustomTransistionAnimation(
                page: PlayersMenu(
              GameChoicheEnum.ichHabeNochNie,
              gamechoicheenum: GameChoicheEnum.ichHabeNochNie,
            )));
        print(choice.title);
        // = listTruDareQuestions;
        //  InheritedTruDarData.of(context).
      }
      break;
    case 3:
      {
        Navigator.push(
            context, CustomTransistionAnimation(page: CategoryGamePage()));
        print(choice.title);
      }
      break;
    case 4:
      {
        print(choice.title);
      }
      break;
    default:
      {
        print('route not found');
      }
      break;
  }
}
