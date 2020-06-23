import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/GameChoicheEnum.dart';
import 'package:testflutter/NeverEverHaveIPage.dart';

import 'package:testflutter/SchaetzenPage.dart';
import 'package:testflutter/TruthOrDarePage.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'customTransistionAnimation.dart';
import 'main.dart';
import 'Player.dart';

//TODO Use Playerliste und wähl RandomSpieler aus, welcher Name bei Wahl/Pfilch knöppfe Auftaucht. Dann sollte/Könnte dieser Person
//sachen mit anderen Personen machen

class PlayersMenu extends StatefulWidget {
  final GameChoicheEnum gamechoicheenum;

  PlayersMenu(GameChoicheEnum wahrheitOderPflicht,
      {@required this.gamechoicheenum});

  @override
  _PlayersMenuState createState() => _PlayersMenuState();
}

class _PlayersMenuState extends State<PlayersMenu>
    with TickerProviderStateMixin {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  ///FocusNode myFocusNode;
  ScrollController _controller = ScrollController();

  final _players = <Player>[
    Player.fromStart(name: 'Player1'),
    Player.fromStart(name: 'Player2'),
  ];

  void _routeHandler() {
    print(widget.gamechoicheenum.toString());
    switch (widget.gamechoicheenum) {
      case GameChoicheEnum.wahrheitOderPflicht:
        {
          Navigator.push(
              context,
              CustomTransistionAnimation(
                  page: TruthOrDarePage(listPlayer: _players,)));
        }
        break;
      case GameChoicheEnum.ichHabeNochNie:
        Navigator.push(
            context,
            CustomTransistionAnimation(
                page: NeverEverHaveIPage(listPlayer: _players,)));

        break;
      default:
        {
          print('route not found');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomPadding: false,
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
              //_warningTextNoPlayers(),
              RaisedButton(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  if (_players.length < 2) {
                    _showNoPlayersDialog();
                  } else {
                    _routeHandler();

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           TruthOrDarePage(listPlayer: _players)),
                    // );
                  }
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

  Future<void> _showNoPlayersDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Mindesten zwei Freunde können Prosten!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ich hole meine Freunde'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _warningTextNoPlayers() {
    return Text(
      'Mindesten zwei Spieler können Prosten!',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,

      //style: TextStyle(fontWeight: FontWeight.bold),
    );
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
