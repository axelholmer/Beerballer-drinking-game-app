// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Question.dart';
import 'package:testflutter/SchaetzenPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SchaetzenPage.dart';
import 'TruthOrDareQuestion.dart';
import 'player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'playerMenuPage.dart';

//Todo put underscore(private) to items
//ctrl och click pa ngt bra genväg

List<Question> listEstimateQuestions;
List<TruthOrDareQuestion> listTruDareQuestions;
void main() {
  loadEstimateAsset().then((value) {
    //TODO look up where you should load assets
    listEstimateQuestions = value;
  });


  loadTruDareAsset().then((value) {
    //TODO look up where you should load assets
    listTruDareQuestions = value;
  });

  runApp(MyApp());
}

//Test of InheritedWidget
//Try surround Materialapp with inheritedwidget and update Values over updateShouldNotify
class InheritedTruDarData extends InheritedWidget {
  InheritedTruDarData({
    Key key,
    this.listTruDareQuestions,
    Widget child,
  }) : super(key: key, child: child);
  final List<TruthOrDareQuestion> listTruDareQuestions;

  @override
  bool updateShouldNotify(InheritedTruDarData old) =>
      listTruDareQuestions != old.listTruDareQuestions;

  static InheritedTruDarData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedTruDarData>();
  }
}

//Estimate Load
Future<List<Question>> loadEstimateAsset() async {
  WidgetsFlutterBinding.ensureInitialized();

  final questionsString =
      await rootBundle.loadString('./assets/res/textfile.json');

  return parseEstimateQuestion(questionsString);
}

List<Question> parseEstimateQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedTruDarData(
      child: MaterialApp(
        title: 'Beerballer Trinkspiele',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.orangeAccent[200],
            fontFamily: 'Oswald'),
        home: GameMenu(),
      ),
      listTruDareQuestions: listTruDareQuestions,
    );
  }
}

class GameMenu extends StatelessWidget {
  final List<GameChoice> _gameChoices = const <GameChoice>[
    const GameChoice(title: 'Schaetzen', id: 0),
    const GameChoice(title: 'Wahrheit oder Pflicht', id: 1),
    const GameChoice(title: 'Ich habe noch nie', id: 2),
    const GameChoice(title: 'Kategoriespiel', id: 3),
    const GameChoice(title: 'Game5', id: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _gameChoiceButtons(_gameChoices, context),
      bottomNavigationBar: _bottomNavigationBarButtons(context),
      floatingActionButton: _customfloatingactionbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _customfloatingactionbutton() {
  return Container(
      height: 75.0,
      width: 75.0,
      child: FloatingActionButton(
          onPressed: () {},
          child: new ConstrainedBox(
              constraints: new BoxConstraints.expand(),
              child: new Image.asset("./assets/images/logo.png",
                  fit: BoxFit.cover, gaplessPlayback: true))));
}

//Todo implement this method with all the other buttons, parameter says what to do
_launchURLInsta() async {
  final url = 'https://www.instagram.com/beerballer/?hl=en';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//Todo implement this method with all the other buttons, parameter says what to do
_launchURLShop() async {
  final url = 'https://beerballer.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//Todo implement this method with all the other buttons, parameter says what to do
_launchURLFacebook() async {
  final url = 'https://www.facebook.com/BeerBaller/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _bottomNavigationBarButtons(BuildContext context) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: Container(
      //color: Theme.of(context).accentColor,
      height: 60.0,
      child: Row /*or Column*/ (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.info),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.shopify),
            onPressed: _launchURLShop,
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.instagram),
            onPressed: _launchURLInsta,
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: _launchURLFacebook,
          ),
        ],
      ),
    ),
  );
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
  final int id;
}
//TODO Enum better als string?
// enum UserStatus {
//   notDetermined,
//   notSignedIn,
//   signedIn,
// }
// UserStatus.notDetermined;

void _selectGameChoice(GameChoice choice, BuildContext context) {
  switch (choice.id) {
    case 0:
      {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SchaetzenPage(listQuestions: listEstimateQuestions)),
        );
      }
      break;
    case 1:
      {
        print(choice.title);

        print(listTruDareQuestions);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayersMenu(),
          ),
        );
      }
      break;
    case 2:
      {
        print(choice.title);
        // = listTruDareQuestions;
      //  InheritedTruDarData.of(context).
       print( InheritedTruDarData.of(context).listTruDareQuestions);
      }
      break;
    case 3:
      {
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
