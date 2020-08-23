import 'package:flutter/material.dart';
import 'package:testflutter/Questionclasses/QuestionEstimation.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'SizeConfig.dart';

class EstimateSwipe extends StatefulWidget {
  // int _index = 0;

  @override
  _EstimateSwipeState createState() => _EstimateSwipeState();
}

class _EstimateSwipeState extends State<EstimateSwipe>
    with TickerProviderStateMixin {
  int _index = 0;

  List<QuestionEstimation> estimateQuestions = List<QuestionEstimation>();
  bool isInfoExplVisible = false;

  hideInfoExpl() {
    setState(() {
      print(isInfoExplVisible);
      if (isInfoExplVisible) {
        isInfoExplVisible = false;
      } else {
        isInfoExplVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!estimateQuestions.isNotEmpty) {
      estimateQuestions = InheritedMainWidget.of(context).listEstimateQuestions;
      estimateQuestions.shuffle();
    }
    //print(estimateQuestions[_index].questionText);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
            child: Stack(
          children: [
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
                itemCount: estimateQuestions.length,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: QuestionCard(question: estimateQuestions[i]),

                    //  Card(
                    //   elevation: 6,
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    //   child: Center(
                    //     child: Text(
                    //       "${estimateQuestions[i].questionText}",
                    //       style: TextStyle(fontSize: 32),
                    //     ),
                    //   ),
                    // ),
                  );
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
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ))
          ],
        )));
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

  // @override
  // void didUpdateWidget(QuestionCard oldWidget) {
  //   print("update: " + oldWidget.question.questionText);
  //   super.didUpdateWidget(oldWidget);
  //  // _question = widget.question;
  //  // _controller.reset();
  // }

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
              ..scale(_backScale.value, 1.0, 1.0);
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

Widget questionCardWidget(
    String text, BuildContext context, CardToogle _handleCardToogle) {
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
              child: CardSide(
                text: text,
                onCardToogle: _handleCardToogle,
              ))));
}

typedef void CardToogle();

class CardSide extends StatelessWidget {
  CardSide({this.text, this.onCardToogle}) : super(key: ObjectKey(text));

  final String text;
  final CardToogle onCardToogle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //TODO put this one one Widget up.
      onTap: () {
        onCardToogle();
      },

      child: Center(
          child: CustomCardText(context, "Schätzen",
              "./assets/images/IconsInGame/estimateIcon.jpg", text)),
    );
  }
}
