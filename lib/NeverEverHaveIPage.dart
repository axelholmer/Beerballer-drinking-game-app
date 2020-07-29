import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future, Timer;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Player.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'TypeOfQuestion.dart';

//Question randomperson oder jungste person und dannach reihe? Normaler fall bei random so gibt es eine Flasche
//Randomperson und spiel wählt ein person aus zufällig, die Objekt für Pflicht/Wahrheit ist.

class NeverEverHaveIPage extends StatefulWidget {
  final List<Player> listPlayer;
  NeverEverHaveIPage({
    Key key,
    this.listPlayer,
  }) : super(key: key);

  @override
  _NeverEverHaveIPageState createState() => _NeverEverHaveIPageState();
}

class _NeverEverHaveIPageState extends State<NeverEverHaveIPage>
    with TickerProviderStateMixin {
  QuestionNeverHaveI _currentQuestion;
  int _questionListCount;
  int _currentPlayerListCount;
  String _currentPlayerName;

  bool _isCardvisible = true;

  @override
  void initState() {
    _questionListCount = 0;
    _currentPlayerListCount = 0;
    _getPlayerName();
    Timer(Duration(milliseconds: 200), () {
      _showMyDialog();
    });

    super.initState();
  }

  void _getPlayerName() {
    if (_currentPlayerListCount < widget.listPlayer.length) {
      _currentPlayerName = widget.listPlayer[_currentPlayerListCount].name;
      _currentPlayerListCount++;
    } else {
      _currentPlayerListCount = 0;
      _currentPlayerName = widget.listPlayer[_currentPlayerListCount].name;
      _currentPlayerListCount++;
    }
  }

  void _getQuestion(List<QuestionNeverHaveI> list) {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];

    if (_questionListCount < list.length) {
      _currentQuestion = list[_questionListCount];
      _questionListCount++;
    } else {
      _questionListCount = 0;
      _currentQuestion = list[_questionListCount];
      _questionListCount++;
    }
  }

  Widget _playerNameText() {
    return Text(
      _currentPlayerName,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        fontSize: 30.0,
        color: Colors.orange[200],
      ),
      //style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _nextCard() {
    return RaisedButton(
      color: Color.fromRGBO(255, 255, 255, 0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black)),
      onPressed: () {
        setState(() {
          _isCardvisible = true;
        });
      },
      child: Container(
        child: Text(
          "Ich habe noch nie...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Oswald',
          ),
        ),
      ),
    );
  }

//TODO add gradient to dialog? And maybe card?
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Wahrheit oder Pflicht',
            style: TextStyle(
              fontFamily: 'Oswald',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Regeln Blablabla',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                  ),
                ),
                Text(
                  'Einverstanden?',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Los!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<QuestionNeverHaveI> neverEverHaveIList =
        InheritedMainWidget.of(context).listNeverHaveIQuestions;
    _getQuestion(neverEverHaveIList);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(255, 255, 255, 0),
            ),
            Visibility(
              visible: _isCardvisible == false,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _playerNameText(),
                  _nextCard(),
                ],
              )),
            ),
            Visibility(
              visible: _isCardvisible == true,
              child: Center(
                child: QuestionCard(
                  //Here QuestionCard
                  question: _currentQuestion,
                  key: ValueKey<QuestionNeverHaveI>(_currentQuestion),
                ),
              ),
            ),
            Visibility(
              visible: _isCardvisible == true,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: RaisedButton(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {
                          setState(() {
                            //_getQuestion(neverEverHaveIList);
                            _getPlayerName();
                            _isCardvisible = false;
                          });
                        },
                        child: Container(
                          child: Text(
                            "Nächste Person",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Oswald',
                            ),
                          ),
                        ),
                      ))),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
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
                                    _showMyDialog();
                                  },
                                  icon: Icon(Icons.help_outline),
                                  iconSize: 50,
                                  //purple
                                ))),
                      ],
                    ))),
          ],

          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     generateRandomQuestion();
          //   },
          //   label: Text('Naechste Frage'),
          //   backgroundColor: Colors.orange,
          // ),
        ));
  }
}

class QuestionCard extends StatefulWidget {
  final QuestionNeverHaveI question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  QuestionNeverHaveI _question;

  String frontCardText;

  @override
  void initState() {
    super.initState();

    _question = widget.question;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _question = widget.question;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        InkWell(
            //TODO put this one one Widget up.
            onTap: () {
              //onCardToogle();
            },
            child: questionCardWidget(
              _question.questionText,
              context,
            )),
      ],
    );
  }
}

Widget questionCardWidget(String text, BuildContext context) {
  return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.7, //TODO can be weird, maybe try with paddingclass
      width: MediaQuery.of(context).size.width * 0.74,
      child: Card(
          color: Color.fromRGBO(242, 227, 208, 1),
          elevation: 15.0,
          child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.95,
              child: Container(
                  //TODO Try to change Card shadow elevation etc..
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white, //TODO other white
                    width: 3,
                  )),
                  child: CardSide(text: text)))));
}

class CardSide extends StatelessWidget {
  CardSide({this.text}) : super(key: ObjectKey(text));

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        widthFactor:
            0.85, //TODO mayby muss try with padding class, can be better for bigger screen, also card stays small.
        heightFactor: 0.9,
        child: Center(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              height: 2,
              fontFamily: 'Oswald',
            ),
          ),
        ),
      ),
    );
  }
}
