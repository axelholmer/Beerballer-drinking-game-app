import 'package:flutter/material.dart';
import 'package:testflutter/CustomCardNeverEverHaveI.dart';
import 'package:testflutter/CustomWidget/CustomCardTextTruthOrDare.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';

import 'package:testflutter/Questionclasses/QuestionNeverHaveI.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'SizeConfig.dart';

class CategoryGamePageSwipe extends StatefulWidget {
  // int _index = 0;

  @override
  _CategoryGamePageSwipeState createState() => _CategoryGamePageSwipeState();
}

class _CategoryGamePageSwipeState extends State<CategoryGamePageSwipe>
    with TickerProviderStateMixin {
  int _index = 0;
  List<QuestionCategoryGame> questionsList = List<QuestionCategoryGame>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO add check if list is empty to avoid repeated calls
    // listTruthQuestions = _getTruthOrDareLists(context, TypeOfQuestion.truth);

    // listDareQuestions = _getTruthOrDareLists(context, TypeOfQuestion.dare);
    if (!questionsList.isNotEmpty) {
      questionsList = InheritedMainWidget.of(context).listCategoryQuestions;
      questionsList.shuffle();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 35,
            ),
            CustomTopTitleScreenForIngameApp(
              context,
              "Schaetzen",
            ),
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
                    child: questionCardBackSideWidget(context, questionsList[i].questionText, "Categoriespiel", "./assets/images/IconsInGame/categoryIcon.jpg"));
              },
            )),
            SizedBox(
              //always need this for title screens
              height: SizeConfig.blockSizeVertical * 30,
            ),
          ]),
        ));
  }
}

class QuestionCard extends StatefulWidget {
  //Not used
  //final TruthOrDareQuestion question;
//Card({Key key, @required this.question}) : super(key: key);
  //QuestionCard(GetDareQuestion _getDareQuestion, GetTruthQuestion _getTruthQuestion);
  QuestionCard({this.question});

  final QuestionCategoryGame question;

  //  final List<TruthOrDareQuestion> listTruthQuestions;

  // final List<TruthOrDareQuestion> listDareQuestions;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin {
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
}

Widget questionCardFrontSideWidget(
    BuildContext context, CardToogle _handleCardToogle) {
  //Here Imp turn animation.
  return  FractionallySizedBox(
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
              )));
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
  return FractionallySizedBox(
    alignment: Alignment.topCenter,
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
              )));
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
