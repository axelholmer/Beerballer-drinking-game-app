import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../CustomWidget/BottomNavigationBarButtons.dart';
import '../CustomWidget/CustomTopTitleScreen2.dart';
import '../CustomWidget/Customfloatingactionbutton.dart';
import '../SizeConfig.dart';
import '../GameChoicheEnum.dart';
import '../main.dart';

class ShopDrinkingGamesMenuPage extends StatefulWidget {
  @override
  _ShopDrinkingGamesMenuPageState createState() =>
      _ShopDrinkingGamesMenuPageState();
}

class _ShopDrinkingGamesMenuPageState extends State<ShopDrinkingGamesMenuPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _shopChoiceWidgets(context),
      bottomNavigationBar: BottomNavigationBarButtons(context),
      floatingActionButton: Customfloatingactionbutton(
          InheritedMainWidget.of(context).myLogo, this, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _shopChoiceWidgets(BuildContext context) {
  return Center(
      child: Column(
    children: <Widget>[
      SizedBox(
        //always need this for title screens
        height: SizeConfig.blockSizeVertical * 35,
      ),
      CustomTopTitleScreen2(
        context,
        "Trinkspiele",
        "./assets/images/inGameAppIcon.png",
      ),

      SizedBox(
        //always need this for title screens
        height: SizeConfig.blockSizeVertical * 50,
      ),

      // Flexible(
      //     child: FractionallySizedBox(
      //         heightFactor: 1.7,
      //         widthFactor: 1,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: <Widget>[

      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Shotpong", "./assets/images/inGameAppIcon.png"),
              context)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Dare Pong", "./assets/images/diceGamesIcon.png"),
              context)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Wer lacht verliert!", "./assets/images/cardGamesIcon.png"),
              context)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Bar Quartett", "./assets/images/boardGameIcon.png"),
              context)),
      // Flexible(
      //     child: FractionallySizedBox(
      //   heightFactor: 0.85,
      // )),
      //   Flexible(
      //     child: _gameChoiceButton(
      //         Tuple2<String, String>(
      //             "Becherspiele", "./assets/images/cupGamesIcon.png"),
      //         context)),
      //  Flexible(
      //     child: FractionallySizedBox(
      //   heightFactor: 0.85,
      // )),
      // Flexible(
      //     child: _gameChoiceButton(
      //         Tuple2<String, String>(
      //             "Kaum Material", "./assets/images/otherGamesIcon.png"),
      //         context)),
      //           Flexible(
      //     child: FractionallySizedBox(
      //   heightFactor: 0.85,
      // )),
    ],
  ));
}

Widget _shopMenuChoiceButton(
    Tuple2<String, String> gameChoice, BuildContext context) {
  return FractionallySizedBox(
      heightFactor: 0.9,
      widthFactor: 0.80,
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
            side: BorderSide(
              color: Theme.of(context).accentColor,
            )),
        onPressed: () {
          _selectShopMenuChoice(gameChoice, context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Flexible(  //Fix box
            //     child: FractionallySizedBox(
            //   widthFactor: 0.4,
            // )),
            SizedBox(
              // height: SizeConfig.blockSizeVertical * 2,
              width: SizeConfig.blockSizeHorizontal * 1,
            ),
            Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.78,
              widthFactor: 0.9,
              child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: AutoSizeText(
                    gameChoice.item1,
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

            Image.asset(
              gameChoice.item2,
              width: SizeConfig.blockSizeHorizontal * 140,
              height: SizeConfig.blockSizeVertical * 80,
            ),
          ],
        ),
      ));
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

//TODO a loadFunction for multiplelists
void _selectShopMenuChoice(
    Tuple2<String, String> choice, BuildContext context) {
  // switch (choice.item1) {
  //   case "In-App Spiele":
  //     {
  //       Navigator.push(
  //           context, CustomTransistionAnimation(page: InAppGamesPageMenu()));
  //     }
  //     break;
  //   case "Würfelspiele":
  //     // Navigator.push(
  //     //     context,
  //     //     CustomTransistionAnimation(
  //     //         page: listOfGames(
  //     //             items: List<String>.generate(10000, (i) => "Item $i"))));
  //    listDiceGames = sortGamesIntoLists(listGames, "dicegame");
  //     Navigator.push(
  //         context,
  //         CustomTransistionAnimation(
  //             page: listOfGames(
  //                 items: listDiceGames,
  //                 logPath: choice.item2,
  //                 pageTitle: choice.item1)));
  //     break;
  //   case "Kartenspiele":
  //     listCardGames = sortGamesIntoLists(listGames, "cardgame");
  //     Navigator.push(
  //         context,
  //         CustomTransistionAnimation(
  //             page: listOfGames(
  //                 items: listCardGames,
  //                 logPath: choice.item2,
  //                 pageTitle: choice.item1)));
  //     break;
  //   case "Brettspiele":
  //     listBoardGames = sortGamesIntoLists(listGames, "boardgame");
  //     print(listBoardGames);
  //     Navigator.push(
  //         context,
  //         CustomTransistionAnimation(
  //             page: listOfGames(
  //                 items: listBoardGames,
  //                 logPath: choice.item2,
  //                 pageTitle: choice.item1)));
  //     break;
  //   case "Becherspiele":
  //     listCupGames = sortGamesIntoLists(listGames, "cupgame");
  //     print(listCupGames);
  //     Navigator.push(
  //         context,
  //         CustomTransistionAnimation(
  //             page: listOfGames(
  //                 items: listCupGames,
  //                 logPath: choice.item2,
  //                 pageTitle: choice.item1)));
  //     break;
  //   case "Kaum Material":
  //    listOtherGames = sortGamesIntoLists(listGames, "?");
  //      Navigator.push(
  //         context,
  //         CustomTransistionAnimation(
  //             page: listOfGames(
  //                 items: listOtherGames,
  //                 logPath: choice.item2,
  //                 pageTitle: choice.item1)));
  //     break;
  //   default:
  //     {
  //       print('route not found');
  //     }
  //     break;
  // }
}
