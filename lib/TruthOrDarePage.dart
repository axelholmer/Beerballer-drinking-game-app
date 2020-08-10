import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future, Timer;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'package:testflutter/Questionclasses/Question.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Player.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';

import 'SizeConfig.dart';
import 'TypeOfQuestion.dart';

//Question randomperson oder jungste person und dannach reihe? Normaler fall bei random so gibt es eine Flasche
//Randomperson und spiel wählt ein person aus zufällig, die Objekt für Pflicht/Wahrheit ist.

class TruthOrDarePage extends StatefulWidget {
  final List<Player> listPlayer;

  TruthOrDarePage({Key key, @required this.listPlayer}) : super(key: key);
  @override
  _TruthOrDarePageState createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage>
    with TickerProviderStateMixin {
  TruthOrDareQuestion _currentQuestion;
  int _truthQuestionListCount;
  int _dareQuestionListCount;
  int _currentPlayerListCount;
  bool _isCardvisible = false;
  String _currentPlayerName;

  @override
  void initState() {
    print(widget.listPlayer);
    widget.listPlayer.shuffle();
    _truthQuestionListCount = 0;
    _dareQuestionListCount = 0;
    _currentPlayerListCount = 0;
    _getPlayerName();
    // Timer(Duration(milliseconds: 200), () {
    //   _showMyDialog();
    // });

    super.initState();
  }

//HEre enum
  static List<TruthOrDareQuestion> _getTruthOrDareLists(
      BuildContext context, TypeOfQuestion type) {
    List<TruthOrDareQuestion> allQuestionsList =
        InheritedMainWidget.of(context).listTruDareQuestions;

    allQuestionsList.shuffle();

    List<TruthOrDareQuestion> dareQuestionList = List<TruthOrDareQuestion>();
    List<TruthOrDareQuestion> truthQuestionList = List<TruthOrDareQuestion>();

    for (final element in allQuestionsList) {
      if (element.typeOfQuestion == TypeOfQuestion.truth) {
        truthQuestionList.add(element);
      } else if (element.typeOfQuestion == TypeOfQuestion.dare) {
        dareQuestionList.add(element);
      } else {
        print("Error CardType: " +
            element.typeOfQuestion.toString()); //TODO Here real logging
      }
    }

    if (type == TypeOfQuestion.truth) {
      return truthQuestionList;
    } else if (type == TypeOfQuestion.dare) {
      return dareQuestionList;
    } else {
      print("No type assigned"); //TODO Here log
      return null;
    }
  }

  void _getTruthQuestion(List<TruthOrDareQuestion> list) {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];

    if (_truthQuestionListCount < list.length) {
      _currentQuestion = list[_truthQuestionListCount];
      _truthQuestionListCount++;
    } else {
      _truthQuestionListCount = 0;
      _currentQuestion = list[_truthQuestionListCount];
      _truthQuestionListCount++;
    }
  }

  void _getDareQuestion(List<TruthOrDareQuestion> list) {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];

    if (_dareQuestionListCount < list.length) {
      _currentQuestion = list[_dareQuestionListCount];
      _dareQuestionListCount++;
    } else {
      _dareQuestionListCount = 0;
      _currentQuestion = list[_dareQuestionListCount];
      _dareQuestionListCount++;
    }
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

  Widget _trueDareButtonsRow(final List<TruthOrDareQuestion> listTruthQuestions,
      final List<TruthOrDareQuestion> listDareQuestions) {
    return Visibility(
        visible: _isCardvisible == false,
        child: Flexible(
            child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 0.4,
                      child: FittedBox(
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          child: Text(
                            _currentPlayerName,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              //fontSize: SizeConfig.safeBlockHorizontal * 10,
                              color: Colors.orange[200],
                            ),
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          )))),
              Flexible(
                  child: FractionallySizedBox(
                      heightFactor: 0.5,
                      widthFactor: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.55,
                                child: RaisedButton(
                                    color: Theme.of(context).accentColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11.0),
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).accentColor)),
                                    onPressed: () {
                                      setState(() {
                                        _getTruthQuestion(listTruthQuestions);
                                        _isCardvisible = true;
                                      });
                                    },
                                    child: FractionallySizedBox(
                                      heightFactor: 1,
                                      widthFactor: 1,
                                      child: FittedBox(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          child: Text(
                                            "Wahrheit",
                                            textAlign: TextAlign.center,
                                            //maxLines: 1,
                                            style: TextStyle(
                                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ))),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 70,
                          ),
                          Flexible(
                            child: FractionallySizedBox(
                                widthFactor: 0.8,
                                heightFactor: 0.55,
                                child: RaisedButton(
                                    color: Theme.of(context).accentColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11.0),
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).accentColor)),
                                    onPressed: () {
                                      setState(() {
                                        _getDareQuestion(listDareQuestions);
                                        _isCardvisible = true;
                                      });
                                    },
                                    child: FractionallySizedBox(
                                      heightFactor: 1,
                                      widthFactor: 1,
                                      child: FittedBox(
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          child: Text(
                                            "Pflicht",
                                            textAlign: TextAlign.center,
                                            //maxLines: 1,
                                            style: TextStyle(
                                                //fontSize: SizeConfig.safeBlockHorizontal * 50,
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ))),
                          )
                        ],
                      ))),
            ],
          ),
        )));
  }

//TODO Refactoring here, too crowded
  @override
  Widget build(BuildContext context) {
    final List<TruthOrDareQuestion> listTruthQuestions =
        _getTruthOrDareLists(context, TypeOfQuestion.truth);
    final List<TruthOrDareQuestion> listDareQuestions =
        _getTruthOrDareLists(context, TypeOfQuestion.dare);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeVertical * 35,
            ),
            CustomTopTitleScreenForIngameApp(context, ""),
            Visibility(
              visible: _isCardvisible == true,
              child: Flexible(
                  child: QuestionCard(
                //Here QuestionCard
                question: _currentQuestion,
                key: ValueKey<TruthOrDareQuestion>(_currentQuestion),
              )),
            ),
            // SizedBox(
            //   height: SizeConfig.blockSizeVertical * 20,
            // ),
            _trueDareButtonsRow(listTruthQuestions, listDareQuestions),

            // Visibility(
            //   visible: _isCardvisible == true,
            //   child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Padding(
            //           padding: const EdgeInsets.all(30.0),
            //           child: RaisedButton(
            //             color: Color.fromRGBO(255, 255, 255, 0.5),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //                 side: BorderSide(color: Colors.black)),
            //             onPressed: () {
            //               setState(() {
            //                 _isCardvisible = false;
            //                 _getPlayerName();
            //               });
            //             },
            //             child: Container(
            //               //
            //               child: Text(
            //                 "Nächste Person",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: 30,
            //                   fontFamily: 'Oswald',
            //                 ),
            //               ),
            //             ),
            //           ))),
            // ),
            // Align(
            //     alignment: Alignment.topLeft,
            //     child: Padding(
            //         padding: const EdgeInsets.all(40.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: <Widget>[
            //             ClipOval(
            //                 child: Material(
            //                     type: MaterialType.transparency,
            //                     child: IconButton(
            //                         // color: Color.fromRGBO(255, 255, 255, 0.5),
            //                         // shape: RoundedRectangleBorder(
            //                         //     borderRadius: BorderRadius.circular(10.0),
            //                         //     side: BorderSide(color: Colors.black)),
            //                         iconSize: 50,
            //                         onPressed: () {
            //                           Navigator.pop(context);
            //                         },
            //                         icon: Icon(Icons.close)))),
            //             Spacer(
            //               flex: 2,
            //             ),
            //             ClipOval(
            //                 child: Material(
            //                     type: MaterialType.transparency,
            //                     child: IconButton(
            //                       onPressed: () {
            //                         _showMyDialog();
            //                       },
            //                       icon: Icon(Icons.help_outline),
            //                       iconSize: 50,
            //                       //purple
            //                     ))),
            //           ],
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
  final TruthOrDareQuestion question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  TruthOrDareQuestion _question;

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
              _question,
              context,
            )),
      ],
    );
  }
}

Widget questionCardWidget(TruthOrDareQuestion question, BuildContext context) {
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
            q: question,
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
  CardSide({this.q}) : super(key: ObjectKey(q));

  final TruthOrDareQuestion q;

  @override
  Widget build(BuildContext context) {
   
   
   
  if(q.typeOfQuestion == TypeOfQuestion.truth){
    return Center(
        child: CustomCardText(context, "Wahrheit",
            "./assets/images/IconsInGame/trueIcon.jpg", q.questionText));
  } else if(q.typeOfQuestion == TypeOfQuestion.dare){
    return Center(
        child: CustomCardText(context, "Pflicht",
            "./assets/images/IconsInGame/dareIcon.jpg", q.questionText));
  }
  else {

     return Center(
        child: CustomCardText(context, "Error",
            "./assets/images/IconsInGame/dareIcon.jpg", "Error"));
  }


  }

}
