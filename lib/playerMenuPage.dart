import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreen2.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'package:testflutter/GameChoicheEnum.dart';
import 'package:testflutter/NeverEverHavieIPageSwipe.dart';


import 'package:testflutter/TruthOrDareSwipePage.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'SizeConfig.dart';
import 'customTransistionAnimation.dart';
import 'main.dart';
import 'Player.dart';

//TODO add Icon to the title text of the page.
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
   // Player.fromStart(name: 'Player2'),
  ];

  void _routeHandler() {
    print(widget.gamechoicheenum.toString());
    switch (widget.gamechoicheenum) {
      case GameChoicheEnum.wahrheitOderPflicht:
        {
          Navigator.push(
              context,
              CustomTransistionAnimation(
                  page: TruthOrDareSwipePage(
                // listPlayer: _players,
              )));
        }
        break;
      case GameChoicheEnum.ichHabeNochNie:
        Navigator.push(
            context,
            CustomTransistionAnimation(
                page: NeverEverHavieIPageSwipe(
             // listPlayer: _players,
            )));

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
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this, context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomPadding: false,
        body: Center(
            child: Column(children: <Widget>[
          SizedBox(
            //always need this for title screens
            height: SizeConfig.blockSizeVertical * 35,
          ),
          CustomTopTitleScreen2(
              context, "Spielermenu", "./assets/images/otherGamesIcon.png"),
          SizedBox(
            //always need this for title screens
            height: SizeConfig.blockSizeVertical * 25,
          ),
          Flexible(
            flex: 3,
            child: FractionallySizedBox(
              heightFactor: 0.95,
              widthFactor: 0.8, // constrain height
              child: _buildPlayerList(),
            ),
          ),
          SizedBox(
            //always need this for title screens
            height: SizeConfig.blockSizeVertical * 30,
          ),
          Flexible(
              flex: 1,
              child: FractionallySizedBox(
                widthFactor: 0.35,
                heightFactor: 0.5,

                child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        side: BorderSide(
                          color: Theme.of(context).accentColor,
                        )),
                    onPressed: () {
                      if (_players.length < 1) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            child: FractionallySizedBox(
                          heightFactor: 1,
                          widthFactor: 0.9,
                          //   alignment: Alignment.center,
                          child: FittedBox(
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              child: AutoSizeText(
                                "Prost!",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                    //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                    fontWeight: FontWeight.w700),
                              )),
                        )),
                      ],
                    )),

                // RaisedButton(
                //   color: Theme.of(context).accentColor,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(11.0),
                //       side: BorderSide(color: Theme.of(context).accentColor)),
                //   onPressed: () {
                //     if (_players.length < 2) {
                //       _showNoPlayersDialog();
                //     } else {
                //       _routeHandler();
                //       // Navigator.push(
                //       //   context,
                //       //   MaterialPageRoute(
                //       //       builder: (context) =>
                //       //           TruthOrDarePage(listPlayer: _players)),
                //       // );
                //     }
                //   },
                //   child: Container(
                //     //
                //     child: Text(
                //       "Prost!",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: SizeConfig.safeBlockHorizontal * 7,
                //       ),
                //     ),
                //   ),
                // ),
              ))
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
      padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 0),
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
        icon: new Icon(
          Icons.add_circle,
          color: Theme.of(context).accentColor,
        ),
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

    // return Container(
    //     height: SizeConfig.blockSizeVertical * 100,
        // width: SizeConfig.blockSizeHorizontal * 20,

        // child: Row(
        //   children: [

        //     Container(
        //       height: SizeConfig.blockSizeVertical * 100,
        //       width: SizeConfig.blockSizeHorizontal * 600,
        //       child: 
        //     TextField(
        //       style: TextStyle(
        //         fontSize: SizeConfig.safeBlockHorizontal * 6,
        //         color: Colors.orange[200],
        //       ),
        //       controller: myController,
        //       onChanged: (text) {
        //         _players[index].name = text;
        //       },
        //       decoration: InputDecoration(
        //           border: InputBorder.none, hintText: player.name),
        //     ),)
        //   ],
        // ));
    return ListTile(

      contentPadding: EdgeInsets.all(SizeConfig.safeBlockVertical * 0),

        title: TextField(
          style: TextStyle(
           fontSize: SizeConfig.safeBlockHorizontal * 7,
            color: Colors.orange[200],
          ),
          controller: myController,
          onChanged: (text) {
            _players[index].name = text;
          },
          decoration:
              InputDecoration(border: InputBorder.none, hintText: player.name),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.remove_circle,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                setState(() {
                  _players.removeAt(index);
                });
              },
            ),
          ],
        ));
  }
}
