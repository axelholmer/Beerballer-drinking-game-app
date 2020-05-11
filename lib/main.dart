// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Question.dart';
import 'package:testflutter/SchaetzenPage.dart';

import 'SchaetzenPage.dart';

List<Question> listQuestions;
void main() {

  //  loadAsset().then((value) { //TODO look up where you should load assets
  //   Map mapOfQuestions = json.decode(value);
  // });
  

  // loadAsset().then((value) { //TODO look up where you should load assets
  //   map = json.decode(value);
  // });


  loadAsset().then((value) { //TODO look up where you should load assets
    listQuestions = value;
    
  });


  
  runApp(MyApp());
}



Future<String> loadAssetWidget(BuildContext context) async {
  return await DefaultAssetBundle.of(context).loadString('./assets/res/textfile.json');
}

// Future<String> loadAsset() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   return await rootBundle.loadString('./assets/res/textfile.json');
// }

Future<List<Question>> loadAsset() async {
WidgetsFlutterBinding.ensureInitialized();

  final questionsString = await rootBundle.loadString('./assets/res/textfile.json');

  return parseQuestion(questionsString);
}

List<Question> parseQuestion(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: PlayersMenu(),
    );
  }
}

class PlayersMenu extends StatefulWidget {
  @override
  _PlayersMenuState createState() => _PlayersMenuState();
}

class GameChoice {
  const GameChoice({this.title, this.id});
  final String title;
  final int id;
}

const List<GameChoice> gameChoices = const <GameChoice>[
  const GameChoice(title: 'Schaetzen', id: 0),
  const GameChoice(title: 'Wahrheit oder Pflicht', id: 1),
  const GameChoice(title: 'Ich habe noch nie', id: 2),
  const GameChoice(title: 'Kategoriespiel', id: 3),
];

class Player {
   Player(){
this.name = 'Kevin'; //lagg till wollnys
   }
  Player.fromStart({this.name});
  String name;
  bool hasName = false; //TODO fix blacktext when name is inputed, also need confirmation to only play when player have inputed name
}
//TODO randomnamn när man trycker pa newplayer?
//TODO fixa var variable _players, masta vara 
class _PlayersMenuState extends State<PlayersMenu> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();
  FocusNode myFocusNode;


  GameChoice _selectedChoice = gameChoices[0];
  final _players = <Player>[
    Player.fromStart(name: 'Player1'),
    Player.fromStart(name: 'Player2'),
    Player.fromStart(name: 'Player3'),
    Player.fromStart(name: 'Player4'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Debugmenu'),
          actions: <Widget>[ //TODO put these in separete funktions
            // Add 3 lines from here...
            //IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
            // overflow menu
            PopupMenuButton<GameChoice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return gameChoices.map((GameChoice choice) {
                  return PopupMenuItem<GameChoice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              }),
          ], 
          // ... to here.
        ),
        body: Stack(children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("./assets/images/logo.jpg"),
          //       fit: BoxFit.scaleDown,
          //     ),
          //   ),
          //   // child: _buildSuggestions(), /* add child content here */
          // ),
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.50),
          ),
          Container(
            child: _buildPlayerList(),
          )
        ]));
  }

//fix select of routes, avoid switch and more compact class. check out named routes
void _select(GameChoice choice) {

    switch (choice.id) {
  case 0:
    {
       
      Navigator.push(
    context,
   
    MaterialPageRoute(builder: (context) => SchaetzenPage(listQuestions: listQuestions)),
  );
    }
  break;
    
  default:
    {
      print('route not found');
    }
}
  }

@override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            // Add 6 lines from here...
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          ); // ... to here.
        },
      ),
    );
  }

  Widget _buildPlayerList() {
    return ListView.separated(
      itemCount: _players.length + 1,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {

        if (index == _players.length) {
          return _buildLastRow();
        }
        return _buildRow(_players[index], index);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildLastRow() {
    return ListTile(
      onTap: () {
        setState(() {
          _players.add(Player());
          //myFocusNode.requestFocus(); TODO fix Reqfocus for the right Tile
        });
      },
      leading: IconButton( //TODO fixa denna
        icon: new Icon(Icons.add_circle),
      ),
    );
  }

  Widget _buildRow(Player player, int index) {
    final myController = TextEditingController();

    return ListTile(
      title: TextField(
        style: _biggerFont,
        controller: myController,
        focusNode: myFocusNode,
        onChanged: (text) {
          _players[index].name = text;
        },
        decoration:
            InputDecoration(border: InputBorder.none, hintText: player.name),
      ),

      trailing: new IconButton(
        icon: new Icon(Icons.remove_circle),
        onPressed: () {
          setState(() {
            _players.removeAt(index);
          });
        },
      ),
      // onTap: () {
      //   showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return AlertDialog(
      //           title: Text("Change Name"),
      //           content: TextField(
      //             controller: myController,
      //             decoration: InputDecoration(
      //                 border: InputBorder.none, hintText: player.name),
      //           ),
      //           actions: [
      //             FlatButton(
      //               child: Text("Close"),
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //             ),
      //             FlatButton(
      //               child: Text("Accept"),
      //               onPressed: () {
      //                 setState(() {
      //                   print(myController.text);
      //                   _players[index].name = myController.text;
      //                   Navigator.of(context).pop();
      //                 });
      //               },
      //             )
      //           ],
      //         );
      //       });
      // }, // ... to here.
    );
  }
}


