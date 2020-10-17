import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreen.dart';
import 'package:testflutter/NeverEverHavieIPageSwipe.dart';
import 'package:testflutter/Questionclasses/QuestionCategoryGame.dart';
import 'package:testflutter/Questionclasses/QuestionEstimation.dart';
import 'package:testflutter/EstimateSwipe.dart';
import 'package:testflutter/customTransistionAnimation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CategoryGamePage.dart';
import 'CustomWidget/CustomBackButton.dart';
import 'CustomWidget/BottomNavigationBarButtons.dart';
import 'CustomWidget/CustomTopTitleScreen2.dart';
import 'CustomWidget/Customfloatingactionbutton.dart';
import 'Questionclasses/QuestionNeverHaveI.dart';
import 'Questionclasses/TruthOrDareQuestion.dart';
import 'Player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SizeConfig.dart';
import 'TruthOrDareSwipePage.dart';
import 'playerMenuPage.dart';
import 'GameChoicheEnum.dart';
import 'main.dart';

class ShopMenuPage extends StatefulWidget {
  @override
  _ShopMenuPageState createState() => _ShopMenuPageState();
}

class _ShopMenuPageState extends State<ShopMenuPage>
    with TickerProviderStateMixin {
  final List<GameChoice> _gameChoices = const <GameChoice>[
    const GameChoice(title: 'Schätzen', id: GameChoicheEnum.estimate),
    const GameChoice(
        title: 'Wahrheit oder Pflicht',
        id: GameChoicheEnum.wahrheitOderPflicht),
    const GameChoice(
        title: 'Ich habe noch nie', id: GameChoicheEnum.ichHabeNochNie),
    const GameChoice(
        title: 'Kategoriespiel', id: GameChoicheEnum.kategorieSpiel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _gameChoiceWidget(_gameChoices, context),
      bottomNavigationBar: BottomNavigationBarButtons(context),
      floatingActionButton: Customfloatingactionbutton(
          InheritedMainWidget.of(context).myLogo, this, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _gameChoiceWidget(
    final List<GameChoice> gameChoices, BuildContext context) {
  List<Widget> gameChoiceWidgets = [];

  for (var item in gameChoices) {
    //gameChoiceWidgets.add(SizedBox(height: SizeConfig.blockSizeVertical * ));
    gameChoiceWidgets.add(_gameChoiceButton(item, context));
    // gameChoiceWidgets.add(Flexible(
    //     child: FractionallySizedBox(
    //   heightFactor: 0.4,
    // )));
  }
  // gameChoiceWidgets.add(

  return Center(
      //Todo make this text + logo + backbutton its own widget.
      child: Column(children: <Widget>[
    SizedBox(
      //always need this for title screens
      height: SizeConfig.blockSizeVertical * 35,
    ),
    CustomTopTitleScreen2(
      context,
      "In-App Spiele",
      "./assets/images/inGameAppIcon.png",
    ),
    SizedBox(
      //always need this for title screens
      height: SizeConfig.blockSizeVertical * 50,
    ),
    // Flexible(
    //   child: FractionallySizedBox(
    //     widthFactor: 1,
    //     heightFactor: 2.3,
    //     child: Column /*or Column*/ (
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.min,
    //       //crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: gameChoiceWidgets,
    //     ),
    //   ),
    // ),

    Flexible(child: _gameChoiceButton(gameChoices[0], context)),
    Flexible(
        child: FractionallySizedBox(
      heightFactor: 0.45,
    )),
    Flexible(child: _gameChoiceButton(gameChoices[1], context)),
    Flexible(
        child: FractionallySizedBox(
      heightFactor: 0.45,
    )),
    Flexible(child: _gameChoiceButton(gameChoices[2], context)),
    Flexible(
        child: FractionallySizedBox(
      heightFactor: 0.45,
    )),
    Flexible(child: _gameChoiceButton(gameChoices[3], context)),
  ]));
}

Widget _gameChoiceButton(GameChoice gameChoice, BuildContext context) {
  return FractionallySizedBox(
    heightFactor: 1,
    widthFactor: 0.80,
    child: RaisedButton(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
            side: BorderSide(
              color: Theme.of(context).accentColor,
            )),
        onPressed: () {
          _selectGameChoice(gameChoice, context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Flexible(  //Fix box
            //     child: FractionallySizedBox(
            //   widthFactor: 0.4,
            // )),

            // SizedBox(
            //   // height: SizeConfig.blockSizeVertical * 2,
            //   width: SizeConfig.blockSizeHorizontal * 1,
            // ),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.8,
              widthFactor: 1,
              //   alignment: Alignment.center,
              child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  child: AutoSizeText(
                    gameChoice.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        //fontSize: SizeConfig.safeBlockHorizontal * 50,
                        fontWeight: FontWeight.w700),
                  )),
            )),
            // Text(
            //   gameChoice.item1,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: SizeConfig.safeBlockHorizontal * 50,
            //       fontWeight: FontWeight.w700),
            // ),

            //  Flexible(  //Fix box
            //     child: FractionallySizedBox(
            //   widthFactor: 0.4,
            // )),
            // Container(
            //   height: SizeConfig.blockSizeVertical * 1,
            //   width: SizeConfig.blockSizeHorizontal * 3,
            // ),
          ],
        )),
  );

  // return  RaisedButton(
  //   color: Theme.of(context).accentColor,
  //   shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(11.0),
  //       side: BorderSide(
  //         color: Theme.of(context).accentColor,
  //       )),
  //   onPressed: () {
  //     _selectGameChoice(gameChoice, context);
  //   },
  //   child: FractionallySizedBox(
  //     widthFactor: 1,
  //     child: FittedBox(
  //         fit: BoxFit.contain,
  //         child: AutoSizeText(
  //           gameChoice.title,
  //           maxLines: 1,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //               //  fontSize: SizeConfig.safeBlockHorizontal * 6,
  //               ),
  //         )),
  //   ),
  // );
}

class GameChoice {
  const GameChoice({this.title, this.id});
  final String title;
  final GameChoicheEnum id;
}
//TODO Enum better als string?
// enum UserStatus {
//   notDetermined,
//   notSignedIn,
//   signedIn,
// }
// UserStatus.notDetermined;

void _selectGameChoice(GameChoice choice, BuildContext context) {
  switch (choice.id.index) {
    case 0:
      {
        Navigator.push(
            context,
            CustomTransistionAnimation(
                //page: SchaetzenSwipe(listQuestions: listEstimateQuestions)));
                page: EstimateSwipe()));
      }
      break;
    case 1:
      // Navigator.push(
      //     context,
      //     CustomTransistionAnimation(
      //         page: PlayersMenu(
      //       GameChoicheEnum.wahrheitOderPflicht,
      //       gamechoicheenum: GameChoicheEnum.wahrheitOderPflicht,
      //     )));
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: TruthOrDareSwipePage(
                  // listPlayer: _players,
                  )));
      break;
    case 2:
      {
        Navigator.push(
            context,
            // CustomTransistionAnimation(
            //     page: PlayersMenu(
            //   GameChoicheEnum.ichHabeNochNie,
            //   gamechoicheenum: GameChoicheEnum.ichHabeNochNie,
            // ))
            CustomTransistionAnimation(page: NeverEverHavieIPageSwipe()));
        // = listTruDareQuestions;
        //  InheritedTruDarData.of(context).
      }
      break;
    case 3:
      {
        Navigator.push(
            context, CustomTransistionAnimation(page: CategoryGamePage()));
        print(choice.title);
      }
      break;
    case 4:
      {
        print(choice.title);
      }
      break;
    default:
      {
        print('route not found');
      }
      break;
  }
}

newCategorySwipe() {
}
