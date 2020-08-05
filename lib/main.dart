// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/CategoryGamePage.dart';
import 'package:testflutter/InAppGamesPageMenu.dart';
import 'package:testflutter/NeverEverHaveIPage.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';

import 'package:testflutter/Questionclasses/QuestionEstimation.dart';
import 'package:testflutter/SchaetzenPage.dart';
import 'package:testflutter/TruthOrDarePage.dart';
import 'package:testflutter/customTransistionAnimation.dart';
import 'package:testflutter/listOfGames.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'GameClass.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'SchaetzenPage.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'Player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SizeConfig.dart';
import 'playerMenuPage.dart';
import 'GameChoicheEnum.dart';

//TODO create custom SplashScreen
//Todo put underscore(private) to items
//ctrl och click pa ngt bra genväg

List<QuestionEstimation> listEstimateQuestions;
List<TruthOrDareQuestion> listTruDareQuestions;
List<QuestionNeverHaveI> listNeverEverHAveIquestions;
List<QuestionCategoryGame> listCategoryQuestions;
List<GameClass> listGames;
List<GameClass> listBoardGames;
List<GameClass> listCupGames;
List<GameClass> listDiceGames;
List<GameClass> listCardGames;

void main() {
  loadEstimateAsset().then((value) {
    //TODO look up where you should load assets
    listEstimateQuestions = value;
  });

  runApp(MyApp());
}

//TODO replace Container with SizedBox for Gaps -> more eff
class InheritedMainWidget extends InheritedWidget {
  InheritedMainWidget({
    Key key,
    this.myLogo,
    this.listTruDareQuestions,
    this.listNeverHaveIQuestions,
    this.listCategoryQuestions,
    Widget child,
  }) : super(key: key, child: child);
  final List<TruthOrDareQuestion> listTruDareQuestions;
  final List<QuestionNeverHaveI> listNeverHaveIQuestions;
  final List<QuestionCategoryGame> listCategoryQuestions;
  final Image myLogo;

  @override
  bool updateShouldNotify(InheritedMainWidget old) {
    return listTruDareQuestions != old.listTruDareQuestions &&
        myLogo != old.myLogo &&
        listNeverHaveIQuestions != old.listNeverHaveIQuestions &&
        listCategoryQuestions != old.listCategoryQuestions;
  }

  static InheritedMainWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedMainWidget>();
  }
}

//Estimate Load
Future<List<QuestionEstimation>> loadEstimateAsset() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textfile.json');

  return parseEstimateQuestion(questionsString);
}

List<QuestionEstimation> parseEstimateQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionEstimation>((json) => QuestionEstimation.fromJson(json))
      .toList();
}

//TruDare Load
Future<List<TruthOrDareQuestion>> loadTruDareAsset() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textFileTruDar.json');

  return parseTruDareQuestion(questionsString);
}

List<TruthOrDareQuestion> parseTruDareQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<TruthOrDareQuestion>((json) => TruthOrDareQuestion.fromJson(json))
      .toList();
}

//NeverHaveI LOad
Future<List<QuestionNeverHaveI>> loadNeverHaveIAsset() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textFileNeverEver.json');

  return parseNeverHaveIQuestion(questionsString);
}

List<QuestionNeverHaveI> parseNeverHaveIQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionNeverHaveI>((json) => QuestionNeverHaveI.fromJson(json))
      .toList();
}

//Category Load
Future<List<QuestionCategoryGame>> loadCategoryAsset() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textFileCategoryGame.json');

  return parseCategoryQuestion(questionsString);
}

List<QuestionCategoryGame> parseCategoryQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<QuestionCategoryGame>((json) => QuestionCategoryGame.fromJson(json))
      .toList();
}

//Games load
Future<List<GameClass>> loadGames() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textFileGames.json');

  return parseGames(questionsString);
}

List<GameClass> parseGames(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<GameClass>((json) => GameClass.fromJson(json)).toList();
}

List<GameClass> sortGamesIntoLists(List<GameClass> list, String game) {
  List<GameClass> returnList = List<GameClass>();
  for (var i = 0; i < list.length; i++) {
    // switch (list[i].typeOfGame) {
    //   case "boardgame":
    //     listBoardGames.add(list[i]);
    //     break;
    //   case "cardgame":
    //     listCardGames.add(list[i]);
    //     break;
    //   case "dicegame":
    //     listDiceGames.add(list[i]);
    //     break;
    //   case "cupgame":
    //     listCupGames.add(list[i]);
    //     break;
    //   default:
    //     {
    //       print('Gamelist not found: ' + list[i].typeOfGame);
    //     }
    //     break;
    // }
    if (game == list[i].typeOfGame) {
      returnList.add(list[i]);
      //print(list[i].gameName);
    }
  }
  return returnList;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Image myLogo;
  @override
  void initState() {
    // precacheImage(AssetImage("./assets/images/logo.png"), context);
    // precacheImage(AssetImage("./assets/images/bild1.jpg"), context);
    myLogo = Image.asset("./assets/images/BeerBallerLogo_kleiner.png");
    precacheImage(myLogo.image, context);

    loadTruDareAsset().then((value) {
      setState(() {
        listTruDareQuestions = value;
      });
    });

    loadNeverHaveIAsset().then((value) {
      setState(() {
        listNeverEverHAveIquestions = value;
      });
    });

    loadCategoryAsset().then((value) {
      setState(() {
        listCategoryQuestions = value;
      });
    });

    loadGames().then((value) {
      setState(() {
        listGames = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(
        AssetImage("./assets/images/BeerBallerLogo_kleiner.png"), context);
    precacheImage(AssetImage("./assets/images/boardGameIcon.png"), context);
    precacheImage(AssetImage("./assets/images/cardGamesIcon.png"), context);
    precacheImage(AssetImage("./assets/images/cupGamesIcon.png"), context);
    precacheImage(AssetImage("./assets/images/diceGamesIcon.png"), context);
    precacheImage(AssetImage("./assets/images/inGameAppIcon.png"), context);
    precacheImage(AssetImage("./assets/images/otherGamesIcon.png"), context);

    precacheImage(
        AssetImage("./assets/images/games/cardGames/Arschloch.jpg"), context);
    precacheImage(
        AssetImage("./assets/images/games/cardGames/pferderennen.jpg"),
        context);
    precacheImage(
        AssetImage("assets/images/games/cardGames/maumau.jpg"), context);
    // precacheImage(AssetImage("./assets/images/bild1.jpg"), context);
    return InheritedMainWidget(
      child: MaterialApp(
        title: 'Beerballer Trinkspiele',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color.fromRGBO(36, 36, 36, 1),
            accentColor: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Inknut'),
        home: GameMenu(),
      ),
      listTruDareQuestions: listTruDareQuestions,
      listNeverHaveIQuestions: listNeverEverHAveIquestions,
      listCategoryQuestions: listCategoryQuestions,
      myLogo: myLogo,
    );
  }
}

class GameMenu extends StatefulWidget {
  @override
  _GameMenuState createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> with TickerProviderStateMixin {
  // final List<GameChoice> _gameChoices = const <GameChoice>[
  //   const GameChoice(title: 'Schaetzen', id: GameChoicheEnum.estimate),
  //   const GameChoice(
  //       title: 'Wahrheit oder Pflicht',
  //       id: GameChoicheEnum.wahrheitOderPflicht),
  //   const GameChoice(
  //       title: 'Ich habe noch nie', id: GameChoicheEnum.ichHabeNochNie),
  //   const GameChoice(
  //       title: 'Kategoriespiel', id: GameChoicheEnum.kategorieSpiel),
  // ];

  final List<Tuple2<String, String>> _gameChoices =
      const <Tuple2<String, String>>[
    Tuple2<String, String>(
        "In App Spiele", "./assets/images/inGameAppIcon.png"),
    Tuple2<String, String>("Wurfelspiele", "./assets/images/diceGamesIcon.png"),
    Tuple2<String, String>("Kartenspiele", "./assets/images/cardGamesIcon.png"),
    Tuple2<String, String>("Brettspiele", "./assets/images/boardGameIcon.png"),
    Tuple2<String, String>("Becherspiele", "./assets/images/cupGamesIcon.png"),
    Tuple2<String, String>("Sonstiges", "./assets/images/otherGamesIcon.png")
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _gameChoiceWidgets(_gameChoices, context),
      bottomNavigationBar: BottomNavigationBarButtons(context),
      floatingActionButton: Customfloatingactionbutton(
          InheritedMainWidget.of(context).myLogo, this),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _gameChoiceWidgets(
    final List<Tuple2<String, String>> gameChoices, BuildContext context) {
  List<Widget> gameChoiceWidgets = [];

  for (var item in gameChoices) {
    gameChoiceWidgets.add(SizedBox(height: SizeConfig.blockSizeVertical * 1.5));
    gameChoiceWidgets.add(_gameChoiceButton(item, context));
  }
  //gameChoiceWidgets.add(SizedBox(height: SizeConfig.blockSizeVertical * 2));

  return Center(
      child: Column(
    children: <Widget>[
      SizedBox(
        height: SizeConfig.blockSizeVertical * 11,
      ),
      Container(
        width: SizeConfig.screenWidth,
        child: AutoSizeText(
          "Best of Trinkspiele",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 8,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(238, 237, 237, 1),
            height: 0.4,
          ),
        ),
      ),
      Container(
        width: SizeConfig.screenWidth,
        child: AutoSizeText(
          "50 Spiele, um nie wieder nüchtern zu sein!",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 3.8,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(238, 237, 237, 1),
          ),
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 0.1,
      ),
      IntrinsicWidth(
        child: Column /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: gameChoiceWidgets),
      ),
    ],
  ));
}

Widget _gameChoiceButton(
    Tuple2<String, String> gameChoice, BuildContext context) {
  return RaisedButton(
    color: Theme.of(context).accentColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
        side: BorderSide(
          color: Theme.of(context).accentColor,
        )),
    onPressed: () {
      _selectGameChoice(gameChoice, context);
    },
    child: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          // height: SizeConfig.blockSizeVertical * 2,
          width: SizeConfig.blockSizeHorizontal * 2,
        ),
        Text(
          gameChoice.item1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              fontWeight: FontWeight.w700),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 8,
          width: SizeConfig.blockSizeHorizontal * 15,
        ),
        Image.asset(
          gameChoice.item2,
          width: SizeConfig.blockSizeHorizontal * 14,
          height: SizeConfig.blockSizeVertical * 8,
        ),
      ],
    )),
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

//TODO a loadFunction for multiplelists
void _selectGameChoice(Tuple2<String, String> choice, BuildContext context) {
  switch (choice.item1) {
    case "In App Spiele":
      {
        Navigator.push(
            context, CustomTransistionAnimation(page: InAppGamesPageMenu()));
      }
      break;
    case "Wurfelspiele":
      listDiceGames = sortGamesIntoLists(listGames, "dicegame");
      print(listDiceGames);
      // Navigator.push(
      //     context,
      //     CustomTransistionAnimation(
      //         page: listOfGames(
      //             items: List<String>.generate(10000, (i) => "Item $i"))));
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: listOfGames(
                  items: listDiceGames,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Kartenspiele":
      listCardGames = sortGamesIntoLists(listGames, "cardgame");
      print(listCardGames);
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: listOfGames(
                  items: listCardGames,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Brettspiele":
      listBoardGames = sortGamesIntoLists(listGames, "boardgame");
      print(listBoardGames);
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: listOfGames(
                  items: listBoardGames,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Becherspiele":
      listCupGames = sortGamesIntoLists(listGames, "cupgame");
      print(listCupGames);
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: listOfGames(
                  items: listCupGames,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Sonstiges":
      {
        print("Sonstiges");
      }
      break;
    default:
      {
        print('route not found');
      }
      break;
  }
}
