// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

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
import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'SchaetzenPage.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'Player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class InAppGamesPageMenuState extends State<InAppGamesPageMenu> with TickerProviderStateMixin {
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
      body: _gameChoiceButtons(_gameChoices, context),
      bottomNavigationBar: BottomNavigationBarButtons(context),
      floatingActionButton: Customfloatingactionbutton(
          InheritedMainWidget.of(context).myLogo, this),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _gameChoiceButtons(
    final List<GameChoice> gameChoices, BuildContext context) {
  List<Widget> gameChoiceWidgets = [];

  for (var item in gameChoices) {
    gameChoiceWidgets.add(SizedBox(height: 40));
    gameChoiceWidgets.add(_gameChoiceButton(item, context));
  }
  gameChoiceWidgets.add(SizedBox(height: 40));

  return Center(
    child: IntrinsicWidth(
      child: Column /*or Column*/ (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: gameChoiceWidgets,
      ),
    ),
  );
}

Widget _gameChoiceButton(GameChoice gameChoice, BuildContext context) {
  return RaisedButton(
    color: Color.fromRGBO(255, 255, 255, 0.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black)),
    onPressed: () {
      _selectGameChoice(gameChoice, context);
    },
    child: Container(
      //
      child: Text(
        gameChoice.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  );
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
