import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future, Timer;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Player.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'SizeConfig.dart';
import 'TypeOfQuestion.dart';

//Question randomperson oder jungste person und dannach reihe? Normaler fall bei random so gibt es eine Flasche
//Randomperson und spiel wählt ein person aus zufällig, die Objekt für Pflicht/Wahrheit ist.

class CategoryGamePage extends StatefulWidget {
  CategoryGamePage({
    Key key,
  }) : super(key: key);

  @override
  _CategoryGameState createState() => _CategoryGameState();
}

class _CategoryGameState extends State<CategoryGamePage>
    with TickerProviderStateMixin {
  QuestionCategoryGame _currentQuestion;
  int _questionListCount;
  // int _currentPlayerListCount;
  // String _currentPlayerName;
  // bool _isCardvisible = true;

  @override
  void initState() {
    _questionListCount = 0;
    // _currentPlayerListCount = 0;
    // _getPlayerName();
    // Timer(Duration(milliseconds: 200), () {
    //   _showMyDialog();
    // });

    super.initState();
  }

  // void _getPlayerName() {
  //   if (_currentPlayerListCount < widget.listPlayer.length) {
  //     _currentPlayerName = widget.listPlayer[_currentPlayerListCount].name;
  //     _currentPlayerListCount++;
  //   } else {
  //     _currentPlayerListCount = 0;
  //     _currentPlayerName = widget.listPlayer[_currentPlayerListCount].name;
  //     _currentPlayerListCount++;
  //   }
  // }

  void _getQuestion(List<QuestionCategoryGame> list) {
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

  // Widget _playerNameText() {
  //   return Text(
  //     _currentPlayerName,
  //     textAlign: TextAlign.center,
  //     overflow: TextOverflow.ellipsis,
  //     style: new TextStyle(
  //       fontSize: 30.0,
  //       color: Colors.orange[200],
  //     ),
  //     //style: TextStyle(fontWeight: FontWeight.bold),
  //   );
  // }

  // Widget _nextCard() {
  //   return RaisedButton(
  //     color: Color.fromRGBO(255, 255, 255, 0.5),
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //         side: BorderSide(color: Colors.black)),
  //     onPressed: () {
  //       // setState(() {
  //       //   _isCardvisible = true;
  //       // });
  //     },
  //     child: Container(
  //       child: Text(
  //         "Ich habe noch nie...",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 30,
  //           fontFamily: 'Oswald',
  //         ),
  //       ),
  //     ),
  //   );
  // }

//TODO add gradient to dialog? And maybe card?
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Kategoriespiel!',
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
    bool _isCardvisible = true;
    final List<QuestionCategoryGame> categoryQuestionList =
        InheritedMainWidget.of(context).listCategoryQuestions;
    print(categoryQuestionList);
    _getQuestion(categoryQuestionList);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(child: Column(
          children: <Widget>[
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 35,
            ),
            CustomTopTitleScreenForIngameApp(
              context,
              "Schaetzen",
            ),

            Flexible(
              child: QuestionCard(
                //Here QuestionCard
                question: _currentQuestion,
                key: ValueKey<QuestionCategoryGame>(_currentQuestion),
              ),
            ),

            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: RaisedButton(
            //           color: Color.fromRGBO(255, 255, 255, 0.5),
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               side: BorderSide(color: Colors.black)),
            //           onPressed: () {
            //             setState(() {
            //               _getQuestion(categoryQuestionList);
            //               // _getPlayerName();
            //               // _isCardvisible = false;
            //             });
            //           },
            //           child: Container(
            //             child: Text(
            //               "Nächste Person",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: 30,
            //                 fontFamily: 'Oswald',
            //               ),
            //             ),
            //           ),
            //         ))),
          ],

          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     generateRandomQuestion();
          //   },
          //   label: Text('Naechste Frage'),
          //   backgroundColor: Colors.orange,
          // ),
        )));
  }
}

class QuestionCard extends StatefulWidget {
  final QuestionCategoryGame question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  QuestionCategoryGame _question;

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
  return FractionallySizedBox(
      heightFactor: 0.86,
      widthFactor: 0.7,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: BorderSide(
                  //  color: Color.fromRGBO(238, 237, 237, 1),
                  )),
          color: Color.fromRGBO(254, 254, 254, 1),
          elevation: 15.0,
          child: CardSide(
            text: text,
          )));

  // return SizedBox(
  //     height: SizeConfig.blockSizeVertical * 70,
  //     width: SizeConfig.blockSizeHorizontal * 75,
  //     child: Card(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(25.0),
  //             side: BorderSide(
  //               color: Color.fromRGBO(238, 237, 237, 1),
  //             )),
  //         color: Color.fromRGBO(238, 237, 237, 1),
  //         elevation: 15.0,
  //         child: CardSide(text: text)));
}

class CardSide extends StatelessWidget {
  CardSide({this.text}) : super(key: ObjectKey(text));

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomCardText(context, "Kategoriespiel",
            "./assets/images/IconsInGame/categoryIcon.jpg", text));
  
  }
}
