import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/ShopPages/ListOfProductsPage.dart';
import 'package:testflutter/ShopPages/ProductClass.dart';
import 'package:testflutter/ShopPages/ProductListItem.dart';
import 'package:tuple/tuple.dart';
import '../CustomWidget/BottomNavigationBarButtons.dart';
import '../CustomWidget/CustomTopTitleScreen2.dart';
import '../CustomWidget/Customfloatingactionbutton.dart';
import '../SizeConfig.dart';
import '../GameChoicheEnum.dart';
import '../customTransistionAnimation.dart';
import '../main.dart';

class ShopBeerPongEquipmentMenuPage extends StatefulWidget {
 
  @override
  _ShopBeerPongEquipmentMenuPageState createState() =>
      _ShopBeerPongEquipmentMenuPageState();
}

class _ShopBeerPongEquipmentMenuPageState extends State<ShopBeerPongEquipmentMenuPage>
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
  //Here are all Products defined
 final List<ProductClass> listBeerPongTablesProducts = [ProductClass(productName: "Allblack", description: "Schwarz wie die Nacht", url: "https://beerballer.com/produkt/beer-pong-tisch-allblack-beerballer/", productPicturesPaths: [""] )];
 final List<ProductClass> listBallsProducts = [];
 final List<ProductClass> listCupsProducts = [];
 final List<ProductClass> listCarpetProducts = [];
  return Center(
      child: Column(
    children: <Widget>[
      SizedBox(
        //always need this for title screens
        height: SizeConfig.blockSizeVertical * 35,
      ),
      CustomTopTitleScreen2(
        context,
        "Beer Pong",
        "./assets/images/inGameAppIcon.png",
      ),

      SizedBox(
        //always need this for title screens
        height: SizeConfig.blockSizeVertical * 50,
      ),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Tische", "./assets/images/inGameAppIcon.png"),
              context, listBeerPongTablesProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Bälle", "./assets/images/diceGamesIcon.png"),
              context, listBallsProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Becher", "./assets/images/cardGamesIcon.png"),
              context, listCupsProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Matte", "./assets/images/boardGameIcon.png"),
              context, listCarpetProducts)),
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
    Tuple2<String, String> gameChoice, BuildContext context, List<ProductClass> listProducts) {
  return FractionallySizedBox(
      heightFactor: 0.95,
      widthFactor: 0.80,
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
            side: BorderSide(
              color: Theme.of(context).accentColor,
            )),
        onPressed: () {
          _selectShopMenuChoice(gameChoice, context, listProducts);
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

//TODO a loadFunction for multiplelists
void _selectShopMenuChoice(
    Tuple2<String, String> choice, BuildContext context, List<ProductClass> listProducts) {
  switch (choice.item1) {
    case "Tische":
      {
        Navigator.push(
          context,
          CustomTransistionAnimation(
              page:ListOfProductsPage(
                  items: listProducts, //Here Array of Products
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      }
      break;
    // case "Bälle":
    //   Navigator.push(
    //       context,
    //       CustomTransistionAnimation(
    //           page: listOfGames(
    //               items: listDiceGames,
    //               logPath: choice.item2,
    //               pageTitle: choice.item1)));
    //   break;
    // case "Becher":
    //   Navigator.push(
    //       context,
    //       CustomTransistionAnimation(
    //           page: listOfGames(
    //               items: listCardGames,
    //               logPath: choice.item2,
    //               pageTitle: choice.item1)));
    //   break;
    // case "Matte":
    //   Navigator.push(
    //       context,
    //       CustomTransistionAnimation(
    //           page: listOfGames(
    //               items: listBoardGames,
    //               logPath: choice.item2,
    //               pageTitle: choice.item1)));
    //   break;
    default:
      {
        print('route not found');
      }
      break;
  }
}
