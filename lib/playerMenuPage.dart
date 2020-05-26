import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Question.dart';
import 'package:testflutter/SchaetzenPage.dart';
import 'package:testflutter/TruthOrDarePage.dart';

import 'SchaetzenPage.dart';
import 'player.dart';

//TODO Use Playerliste und wähl RandomSpieler aus, welcher Name bei Wahl/Pfilch knöppfe Auftaucht. Dann sollte/Könnte dieser Person
//sachen mit anderen Personen machen

class PlayersMenu extends StatefulWidget {
  @override
  _PlayersMenuState createState() => _PlayersMenuState();
}

class _PlayersMenuState extends State<PlayersMenu> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  ///FocusNode myFocusNode;
  ScrollController _controller = ScrollController();

  final _players = <Player>[
    Player.fromStart(name: 'Player1'),
    Player.fromStart(name: 'Player2'),
    Player.fromStart(name: 'Player3'),
    Player.fromStart(name: 'Player4'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                      child: Material(
                          type: MaterialType.transparency,
                          child: IconButton(
                              // color: Color.fromRGBO(255, 255, 255, 0.5),
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10.0),
                              //     side: BorderSide(color: Colors.black)),
                              iconSize: 50,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close)))),
                  Spacer(
                    flex: 2,
                  ),
                  ClipOval(
                      child: Material(
                          type: MaterialType.transparency,
                          child: IconButton(
                            onPressed: () {
                              print("INFO!");
                            },
                            icon: Icon(Icons.help_outline),
                            iconSize: 50,
                            //purple
                          ))),
                ],
              )),
          SizedBox(
            height: 400, // constrain height
            child: _buildPlayerList(),
          ),
          SizedBox(height: 40),
          RaisedButton(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)),
            onPressed: () {
               Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TruthOrDarePage()),
        );
            },
            child: Container(
              //
              child: Text(
                "Prost!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ])));
  }

//fix select of routes, avoid switch and more compact class. check out named routes

  @override
  void initState() {
    super.initState();
    // myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    // myFocusNode.dispose();
    super.dispose();
  }

  Widget _buildPlayerList() {
    return ListView.separated(
      controller: _controller,
      itemCount: _players.length + 1,
      padding: const EdgeInsets.all(30.0),
      itemBuilder: (context, index) {
        if (index == _players.length) {
          return _buildLastRow();
        }

        // if (index == _players.length - 1) {
        //   return _buildRow(_players[index], index, true);
        // }

        return _buildRow(_players[index], index, false);
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
          //_controller.jumpTo(_controller.position.maxScrollExtent);
          // Timer(Duration(milliseconds: 300){ _controller.animateTo(_controller.position.maxScrollExtent, curve: Curves.ease, duration: Duration(milliseconds: 200))}

          Timer(Duration(milliseconds: 300), () {
            //myFocusNode.requestFocus();
            _controller.animateTo(_controller.position.maxScrollExtent,
                curve: Curves.ease, duration: Duration(milliseconds: 200));
          });

          //TODO fix Reqfocus for the right Tile
        });
      },
      leading: IconButton(
        //TODO fixa denna
        icon: new Icon(Icons.add_circle),
      ),
    );
  }

  Widget _buildRow(Player player, int index, bool lastNamedRow) {
    final myController = TextEditingController();
    //myFocusNode = new FocusNode();
    // if(lastNamedRow){
    // focusNode = myFocusNode;
    // } else {
    // focusNode = null;
    // }

    return ListTile(
      title: TextField(
        style: _biggerFont,
        controller: myController,
        //focusNode: myFocusNode,
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
    );
  }
}
