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
import 'Questionclasses/QuestionEstimation.dart';

//TODO gör swipe och tap tips, ta bort

class SchaetzenPage extends StatefulWidget {
  final List<QuestionEstimation> listQuestions;
  SchaetzenPage({Key key, @required this.listQuestions}) : super(key: key);

  @override
  _SchaetzenPageState createState() => _SchaetzenPageState();
}

class _SchaetzenPageState extends State<SchaetzenPage> with TickerProviderStateMixin{
  QuestionEstimation _currentQuestion;
  int _questionListCount;
  @override
  void initState() {
    _questionListCount = 0;
    widget.listQuestions.shuffle();

    _getQuestion();

    Timer(Duration(milliseconds: 200), () {
      _showMyDialog();
    });

    super.initState();
  }

  void _getQuestion() {
    //return //widget.listQuestions[rng.nextInt(widget.listQuestions.length)];
    setState(() {
      if (_questionListCount < widget.listQuestions.length) {
        _currentQuestion = widget.listQuestions[_questionListCount];
        _questionListCount++;
      } else {
        _questionListCount = 0;
      }
    });
  }

//TODO add gradient to dialog? And maybe card?
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Schätzen!',
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
    print(_currentQuestion.questionText);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: <Widget>[
            // Container(
            //     decoration: new BoxDecoration(
            //       image: new DecorationImage(
            //         image: new AssetImage("./assets/images/bild1.jpg"),
            //         alignment: Alignment(-.95, 0),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     child: new BackdropFilter(
            //       filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            //       child: new Container(
            //         decoration:
            //             new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            //       ),
            //     )),
            Container(
              color: Color.fromRGBO(255, 255, 255, 0),
            ),
            Center(
                child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: QuestionCard(
                question: _currentQuestion,
                key: ValueKey<QuestionEstimation>(_currentQuestion),
              ),
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        _getQuestion();
                      },
                      child: Container(
                        //
                        child: Text(
                          "Nächste Karte",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Oswald',
                          ),
                        ),
                      ),
                    ))),
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
  final QuestionEstimation question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin {
  QuestionEstimation _question;
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  String frontCardText;
  String backSideCardText;

  @override
  void initState() {
    print("avf");
    super.initState();

    _question = widget.question;
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _question = widget.question;
    _controller.reset();
  }

  void _handleCardToogle() {
    setState(() {
      if (_controller.isCompleted || _controller.velocity > 0)
        _controller.reverse();
      else
        _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new AnimatedBuilder(
          child: questionCardWidget(
              _question.questionAnswer, context, _handleCardToogle),
          animation: _backScale,
          builder: (BuildContext context, Widget child) {
            final Matrix4 transform = new Matrix4.identity()
              ..scale(1.0, _backScale.value, 1.0);
            return new Transform(
              transform: transform,
              alignment: FractionalOffset.center,
              child: child,
            );
          },
        ),
        new AnimatedBuilder(
          child: questionCardWidget(
              _question.questionText, context, _handleCardToogle),
          animation: _frontScale,
          builder: (BuildContext context, Widget child) {
            final Matrix4 transform = new Matrix4.identity()
              ..scale(1.0, _frontScale.value, 1.0);
            return new Transform(
              transform: transform,
              alignment: FractionalOffset.center,
              child: child,
            );
          },
        ),
      ],
    );
  }
}

typedef void CardToogle();

Widget questionCardWidget(
    String text, BuildContext context, CardToogle _handleCardToogle) {
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
                  child:
                      CardSide(text: text, onCardToogle: _handleCardToogle)))));
}

class CardSide extends StatelessWidget {
  CardSide({this.text, this.onCardToogle}) : super(key: ObjectKey(text));

  final String text;
  final CardToogle onCardToogle;

  // Color _getColor(BuildContext context) {
  //   // The theme depends on the BuildContext because different parts
  //   // of the tree can have different themes.
  //   // The BuildContext indicates where the build is
  //   // taking place and therefore which theme to use.

  //   return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  // }

  // TextStyle _getTextStyle(BuildContext context) {
  //   if (!inCart) return null;

  //   return TextStyle(
  //     color: Colors.black54,
  //     decoration: TextDecoration.lineThrough,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        //TODO put this one one Widget up.
        onTap: () {
          onCardToogle();
        },
        child: Container(
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
        ));
  }
}
