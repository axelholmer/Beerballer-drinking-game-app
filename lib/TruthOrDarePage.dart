import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future, Timer;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:testflutter/main.dart';

import 'TruthOrDareQuestion.dart';

//Question randomperson oder jungste person und dannach reihe? Normaler fall bei random so gibt es eine Flasche
//Randomperson und spiel wählt ein person aus zufällig, die Objekt für Pflicht/Wahrheit ist.

class TruthOrDarePage extends StatefulWidget {
 
 // List<TruthOrDareQuestion> listTruthQuestions =
  final List<TruthOrDareQuestion> listTruthQuestions = [
    new TruthOrDareQuestion(
        questionText: "Truthquestion", typeOfQuestion: "truth"),
    new TruthOrDareQuestion(
        questionText: "Truthquestion2", typeOfQuestion: "truth"),
    new TruthOrDareQuestion(
        questionText: "Truthquestion3", typeOfQuestion: "truth"),
  ];

  final List<TruthOrDareQuestion> listDareQuestions = [
    new TruthOrDareQuestion(
        questionText: "Darequestion", typeOfQuestion: "dare"),
    new TruthOrDareQuestion(
        questionText: "Darequestion2", typeOfQuestion: "dare"),
    new TruthOrDareQuestion(
        questionText: "Darequestion3", typeOfQuestion: "dare"),
  ];



  @override
  _TruthOrDarePageState createState() => _TruthOrDarePageState();
}

// _assignQuestionsToLists() {
  


 
//   for question in InheritedTruDarData.of(context).listTruDareQuestions {

    
//   }



// }




class _TruthOrDarePageState extends State<TruthOrDarePage> {
  TruthOrDareQuestion _currentQuestion;
  int _truthQuestionListCount;
  int _dareQuestionListCount;
  bool isCardvisible = false;
  
  @override
  void initState() {
    _truthQuestionListCount = 0;
    _dareQuestionListCount = 0;
    // listQuestions.shuffle();

    _getTruthQuestion();
    // _getDareQuestion();

    Timer(Duration(milliseconds: 200), () {
      _showMyDialog();
    });

    super.initState();
  }

  void _getTruthQuestion() {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];

    if (_truthQuestionListCount < widget.listTruthQuestions.length) {
      _currentQuestion = widget.listTruthQuestions[_truthQuestionListCount];
      _truthQuestionListCount++;
    } else {
      _truthQuestionListCount = 0;
      _currentQuestion = widget.listTruthQuestions[_truthQuestionListCount];
      _truthQuestionListCount++;
    }
  }

  void _getDareQuestion() {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];

    if (_dareQuestionListCount < widget.listDareQuestions.length) {
      _currentQuestion = widget.listDareQuestions[_dareQuestionListCount];
      _dareQuestionListCount++;
    } else {
      _dareQuestionListCount = 0;
      _currentQuestion = widget.listDareQuestions[_dareQuestionListCount];
      _dareQuestionListCount++;
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

//TODO Refactoring here, too crowded
  @override
  Widget build(BuildContext context) {

//TODO zum Test
    // List<TruthOrDareQuestion> listDareQuestions = InheritedTruDarData.of(context).listTruDareQuestions;
    // print(listDareQuestions);



    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("./assets/images/bild1.jpg"),
                alignment: Alignment(-.95, 0),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            )),
        Container(
          color: Color.fromRGBO(255, 255, 255, 0),
        ),
        Visibility(
          visible: isCardvisible == true,
          child: Center(
            child: QuestionCard(
              //Here QuestionCard
              question: _currentQuestion,
              key: ValueKey<TruthOrDareQuestion>(_currentQuestion),
            ),
          ),
        ),
        Visibility(
          visible: isCardvisible == false,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    _getTruthQuestion();
                    isCardvisible = true;
                  });
                },
                child: Container(
                  //
                  child: Text(
                    "Wahrheit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30, // constrain height
              ),
              RaisedButton(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    _getDareQuestion();
                    isCardvisible = true;
                  });
                },
                child: Container(
                  //
                  child: Text(
                    "Pflicht",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Visibility(
          visible: isCardvisible == true,
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
                        isCardvisible = false;
                      });
                    },
                    child: Container(
                      //
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
  final TruthOrDareQuestion question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin {
  TruthOrDareQuestion _question;

  String frontCardText;

  @override
  void initState() {
    print("avf");
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
        questionCardWidget(
          _question.questionText,
          context,
        ),
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
