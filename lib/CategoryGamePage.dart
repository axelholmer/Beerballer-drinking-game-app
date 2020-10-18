import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';
import 'package:testflutter/Questionclasses/QuestionEstimation.dart';
import 'package:testflutter/main.dart';

import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomCardText.dart';
import 'CustomWidget/CustomTopTitleScreenForIngameApp.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'CustomWidget/customPopupDialog.dart';
import 'SizeConfig.dart';

class CategoryGamePage extends StatefulWidget {
  // int _index = 0;

  @override
  _CategoryGameState createState() => _CategoryGameState();
}

class _CategoryGameState extends State<CategoryGamePage>
    with TickerProviderStateMixin {
  int _index = 0;
  final List<String> listRules = [
    //TODO change titles.
    "Der Reihe nach muss jeder einen passenden Begriff zu der angezeigten Kategorie nennen.",
    "Wem als erstes kein Begriff mehr einfällt oder einen Begriff doppelt nennt, muss trinken.",
    "Es beginnt der Spieler, der die Karte gezogen hat",
  ];

  List<QuestionCategoryGame> categoryQuestions = List<QuestionCategoryGame>();
  bool isInfoExplVisible = false;

  hideInfoExpl() {
    setState(() {
      print(isInfoExplVisible);
      if (isInfoExplVisible) {
        isInfoExplVisible = false;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => customPopupDialog(
                context, "Kategoriespiel", listRules)); //TODO change these
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
    if (!categoryQuestions.isNotEmpty) {
      categoryQuestions = InheritedMainWidget.of(context).listCategoryQuestions;
      categoryQuestions.shuffle();
    }
    //print(estimateQuestions[_index].questionText);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar: BottomNavigationBarButtons(context),
        floatingActionButton: Customfloatingactionbutton(
            InheritedMainWidget.of(context).myLogo, this, context),
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
                  context, "Kategoriespiel", hideInfoExpl),
              SizedBox(
                //always need this for title screens
                height: SizeConfig.blockSizeVertical * 20,
              ),
              Flexible(
                  child: PageView.builder(
                itemCount: categoryQuestions.length,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: QuestionCard(question: categoryQuestions[i]),

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
                  child: explScreen(context),
                )),
          ],
        )));
  }
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

class QuestionCard extends StatefulWidget {
  final QuestionCategoryGame question;
//Card({Key key, @required this.question}) : super(key: key);
  QuestionCard({Key key, this.question}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<QuestionCard> {
  QuestionCategoryGame _question;
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

  @override
  bool get wantKeepAlive => true;

  void _handleCardToogle() {
    setState(() {
      if (_controller.isCompleted || _controller.velocity > 0)
        _controller.reverse();
      else
        _controller.forward();
    });
  }


//TODO, fix that the Category name also is display, maybe overloading constructors? Oder {this one} and leave one field empty with "".
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new AnimatedBuilder(
          child: questionCardWidget(
              // _question.questionText, context, _handleCardToogle),
              "...Apple\n...Sony\n...Samsung\n...Huawei\n...Motorola\n...Lenovo\n...OnePlus\n...Blackberry\n...Microsoft\n...LG",
              context,
              _handleCardToogle, true),
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
              _question.questionText, context, _handleCardToogle, false),
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
    String text, BuildContext context, CardToogle _handleCardToogle, bool isBackSide) {
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
                  side: BorderSide()),
              color: Color.fromRGBO(254, 254, 254, 1),
              elevation: 15.0,
              child: CardSide(
                text: text,
                onCardToogle: _handleCardToogle,
                isBackside: isBackSide,
              ))));
}

typedef void CardToogle();

class CardSide extends StatelessWidget {
  CardSide({this.text, this.onCardToogle, this.isBackside})
      : super(key: ObjectKey(text));

  final String text;
  final CardToogle onCardToogle;
  final bool isBackside;

  @override
  Widget build(BuildContext context) {
    if (isBackside) {
      return InkWell(
        onTap: () {
          onCardToogle();
        },
        child: Center(
            child: CardTextCategoryBackSide(context, "Kategoriespiel",
                "./assets/images/IconsInGame/estimateIcon.jpg", text)),
      );
    } else {
      return InkWell(
        onTap: () {
          onCardToogle();
        },
        child: Center(
            child: CustomCardText(context, "Kategoriespiel",
                "./assets/images/IconsInGame/estimateIcon.jpg", text)),
      );
    }
  }

  Widget CardTextCategoryBackSide(BuildContext context, String gameTitle,
      String iconPath, String cardText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: FractionallySizedBox(
                heightFactor: 0.55,
                widthFactor: .87,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: AutoSizeText(
                      gameTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //  fontSize: SizeConfig.safeBlockHorizontal * 7,
                        //height: 2,
                        //  height: SizeConfig.safeBlockVertical * 0.23,
                        //fontFamily: 'Oswald',
                        fontWeight: FontWeight.w900,
                      ),
                    )))),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 80,
        ),
        Flexible(
            child: FractionallySizedBox(
          heightFactor: 1.4,
          widthFactor: 0.9,
          alignment: Alignment.bottomCenter,
          child: AutoSizeText(cardText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                //  height: SizeConfig.safeBlockVertical * ,
                //   height: SizeConfig.safeBlockVertical * 0.23,
                //  fontFamily: 'Oswald',
                fontWeight: FontWeight.w600,
              )),
        ))
      ],
    );
  }
}
