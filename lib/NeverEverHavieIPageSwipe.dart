import 'package:flutter/material.dart';
import 'package:testflutter/CustomCardNeverEverHaveI.dart';
import 'package:testflutter/CustomWidget/CustomCardTextTruthOrDare.dart';

import 'package:testflutter/Questionclasses/QuestionNeverHaveI.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'CustomWidget/customPopupDialog.dart';
import 'SizeConfig.dart';

class NeverEverHavieIPageSwipe extends StatefulWidget {
  // int _index = 0;

  @override
  _NeverEverHavieIPageSwipeState createState() =>
      _NeverEverHavieIPageSwipeState();
}

class _NeverEverHavieIPageSwipeState extends State<NeverEverHavieIPageSwipe>
    with TickerProviderStateMixin {
  int _index = 0;
  List<QuestionNeverHaveI> questionsList = List<QuestionNeverHaveI>();
  QuestionNeverHaveI _currentQuestion;
  final List<String> listRules = [
    "Entweder kann man sich Fragen selbst überlegen oder man verwendet diese App um das Spiel „Ich hab noch nie“ zu spielen.",
    "Ein Spieler darf eine Aussage tätigen, z.B. „Ich hab noch nie einen One night stand gehabt“. Jeder, der schon einen hatte, muss trinken. Danach ist der nächste Spieler dran.",
  ];

  bool isInfoExplVisible = false;
  hideInfoExpl() {
    setState(() {
      print(isInfoExplVisible);
      if (isInfoExplVisible) {
        isInfoExplVisible = false;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                customPopupDialog(context, "Ich habe noch nie", listRules));
        isInfoExplVisible = true;
      }
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      hideInfoExpl();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO add check if list is empty to avoid repeated calls
    // listTruthQuestions = _getTruthOrDareLists(context, TypeOfQuestion.truth);

    // listDareQuestions = _getTruthOrDareLists(context, TypeOfQuestion.dare);
    if (!questionsList.isNotEmpty) {
      questionsList = InheritedMainWidget.of(context).listNeverHaveIQuestions;
      questionsList.shuffle();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this, context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
            child: Stack(children: [
          Column(children: <Widget>[
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 35,
            ),
            CustomTopTitleScreenForIngameApp(
                context, "Schaetzen", hideInfoExpl),
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 20,
            ),
            Flexible(
                child: PageView.builder(
              itemCount: questionsList.length,
              controller: PageController(viewportFraction: 0.7),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: QuestionCard(question: questionsList[i]));
              },
            )),
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 30,
            ),
          ]),
          Visibility(
              visible: isInfoExplVisible,
              // maintainState: true,
              child: GestureDetector(
                onTap: () {
                  hideInfoExpl();
                },
                child: explScreen(context),
              )),
        ])));
  }

  Widget explScreen(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
            color: Colors.black.withOpacity(0.55),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 1,
                    child: Image.asset(
                      "./assets/images/IconsInGame/tap.png",
                      // width: SizeConfig.blockSizeHorizontal * 190,
                      // height: SizeConfig.blockSizeVertical * 125,
                      //width: SizeConfig.blockSizeHorizontal * ,
                      //   height: SizeConfig.blockSizeVertical * 8,
                    ),
                  )),
                  Flexible(
                      child: FractionallySizedBox(
                          heightFactor: 0.4,
                          widthFactor: 0.8,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Tap eine Karte zum Umdrehen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  //height: SizeConfig.safeBlockHorizontal * 0.1,
                                  //fontSize: SizeConfig.safeBlockHorizontal * 75,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  //  height: 1,
                                ),
                              )))),
                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                      child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 1,
                    child: Image.asset(
                      "./assets/images/IconsInGame/swipe.png",
                      // width: SizeConfig.blockSizeHorizontal * 190,
                      // height: SizeConfig.blockSizeVertical * 125,
                      //width: SizeConfig.blockSizeHorizontal * ,
                      //   height: SizeConfig.blockSizeVertical * 8,
                    ),
                  )),
                  Flexible(
                      child: FractionallySizedBox(
                          heightFactor: 0.4,
                          widthFactor: 0.7,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Swipe für nächste Karte",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  //   height: SizeConfig.safeBlockHorizontal * 0.1,
                                  //fontSize: SizeConfig.safeBlockHorizontal * 75,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  //  height: 1,
                                ),
                              )))),
                ],
              ),
            )));
  }
}

class QuestionCard extends StatefulWidget {
  //Not used
  //final TruthOrDareQuestion question;
//Card({Key key, @required this.question}) : super(key: key);
  //QuestionCard(GetDareQuestion _getDareQuestion, GetTruthQuestion _getTruthQuestion);
  QuestionCard({this.question});

  final QuestionNeverHaveI question;

  //  final List<TruthOrDareQuestion> listTruthQuestions;

  // final List<TruthOrDareQuestion> listDareQuestions;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<QuestionCard> {
  //TruthOrDareQuestion _question;
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  String frontCardText;
  String backSideCardText;

  //QuestionNeverHaveI _question;
  //Widget _questionWidget;

  //print(typeQ);

  @override
  void initState() {
    super.initState();

    //_question = widget.question;
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

  // @override
  // void didUpdateWidget(QuestionCard oldWidget) {
  //   print("update: " + oldWidget.question.questionText);
  //   super.didUpdateWidget(oldWidget);
  //  // _question = widget.question;
  //  // _controller.reset();
  // }

  void _handleCardToogle() {
    setState(() {
      setState(() {
        if (_controller.isCompleted || _controller.velocity > 0)
          _controller.reverse();
        else
          _controller.forward();
      });

      // if (_controller.isCompleted || _controller.velocity > 0)
      //   _controller.reverse();
      // else
      // typeQ = questionType;
      // if (typeQ == TypeOfQuestion.truth) {
      //   _question = widget.getTruthQuestion();
      //   _questionWidget = questionCardBackSideWidget(
      //       context,
      //       _question.questionText,
      //       "Wahrheit",
      //       "./assets/images/IconsInGame/trueIcon.jpg");
      // } else {
      //   //print("reach");
      //   _question = widget.getDareQuestion();
      //   _questionWidget = questionCardBackSideWidget(
      //       context,
      //       _question.questionText,
      //       "Pflicht",
      //       "./assets/images/IconsInGame/dareIcon.jpg");
      // }
      // _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new AnimatedBuilder(
          child: questionCardBackSideWidget(
              context,
              widget.question.questionText,
              //question.questionText,
              "Ich habe noch nie",
              "./assets/images/IconsInGame/estimateIcon.jpg"),
          animation: _backScale,
          builder: (BuildContext context, Widget child) {
            final Matrix4 transform = new Matrix4.identity()
              ..scale(_backScale.value, 1.0, 1.0);
            return new Transform(
              transform: transform,
              alignment: FractionalOffset.center,
              child: child,
            );
          },
        ),
        new AnimatedBuilder(
          child: questionCardFrontSideWidget(context, _handleCardToogle),
          animation: _frontScale,
          builder: (BuildContext context, Widget child) {
            final Matrix4 transform = new Matrix4.identity()
              ..scale(_frontScale.value, 1.0, 1.0);
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget questionCardFrontSideWidget(
    BuildContext context, CardToogle _handleCardToogle) {
  //Here Imp turn animation.
  return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: FractionallySizedBox(
          heightFactor: 0.85,
          widthFactor: 1,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(
                      //  color: Color.fromRGBO(238, 237, 237, 1),
                      )),
              color: Color.fromRGBO(254, 254, 254, 1),
              elevation: 15.0,
              child: FrontSideCard(
                onCardToogle: _handleCardToogle,
              ))));
}

typedef void CardToogle();

class FrontSideCard extends StatelessWidget {
  FrontSideCard({this.onCardToogle}) : super();

  final CardToogle onCardToogle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCardNeverEverHaveI(context, onCardToogle),
    );
  }
}

Widget questionCardBackSideWidget(
    BuildContext context, String text, String name, String iconPath) {
  //Here Imp turn animation.
  return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: FractionallySizedBox(
          heightFactor: 0.85,
          widthFactor: 1,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(
                      //  color: Color.fromRGBO(238, 237, 237, 1),
                      )),
              color: Color.fromRGBO(254, 254, 254, 1),
              elevation: 15.0,
              child: BackSideCard(
                text: text,
                gameName: name,
                iconPath: iconPath,
              ))));
}

class BackSideCard extends StatelessWidget {
  BackSideCard({this.text, this.gameName, this.iconPath})
      : super(key: ObjectKey(text));

  final String text;
  final String gameName;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCardText(context, gameName, iconPath, text),
    );
  }
}
