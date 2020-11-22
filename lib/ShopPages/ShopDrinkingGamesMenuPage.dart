import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import '../CustomWidget/BottomNavigationBarButtons.dart';
import '../CustomWidget/CustomTopTitleScreen2.dart';
import '../CustomWidget/Customfloatingactionbutton.dart';
import '../SizeConfig.dart';
import '../GameChoicheEnum.dart';
import '../customTransistionAnimation.dart';
import '../main.dart';
import 'ListOfProductsPage.dart';
import 'ProductClass.dart';




//Todo: Check if everythins is alrigt. 

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
  final List<ProductClass> listShotpong = [
    ProductClass(
        productName: "Shotpong Classic",
        description: "Beer Pong als Short Version",
        url:
            "https://beerballer.com/produkt/shotpong-classic-das-party-highlight/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/83.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/84.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/85.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/86.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/87.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/88.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/89.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Standard/90.jpg",
        ]),
    ProductClass(
        productName: "Shotpong Cherry",
        description: "Aus hochwertigem Kirschholz",
        url: "https://beerballer.com/produkt/shotpong-cherry-partyhighlight/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/ShotPong/Cherry/78.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Cherry/79.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Cherry/80.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Cherry/81.jpg",
          "./assets/images/Shop/Trinkspiele/ShotPong/Cherry/82.jpg",
        ]),
  ];
  final List<ProductClass> listDarePong = [
    ProductClass(
        productName: "Dare Pong Classic",
        description: "Beer Pong meets Truth or Dare",
        url:
            "https://beerballer.com/produkt/dare-pong-trinkspielneuheit-partyhighlight/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/DarePong/Normal/70.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/Normal/71.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/Normal/72.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/Normal/73.jpg",
        ]),
        ProductClass(
        productName: "Dare Pong Festival Edition",
        description: "Hol dir das Festival nach Hause",
        url:
            "https://beerballer.com/produkt/dare-pong-festival-edition-trinkspielneuheit/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/DarePong/FestivalEdition/74.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/FestivalEdition/75.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/FestivalEdition/76.jpg",
          "./assets/images/Shop/Trinkspiele/DarePong/FestivalEdition/77.jpg",
        ])
  ];
  final List<ProductClass> listWrLachtVerliert = [
    ProductClass(
        productName: "Wer lacht verliert",
        description: "Niveaulimbo für Erwachsene",
        url:
            "https://beerballer.com/produkt/wer-lacht-verliert-trinkspiel-niveaulimbo/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/Werlachtverliert/91.jpg",
          "./assets/images/Shop/Trinkspiele/Werlachtverliert/92.jpg",
          "./assets/images/Shop/Trinkspiele/Werlachtverliert/93.jpg",
          "./assets/images/Shop/Trinkspiele/Werlachtverliert/94.jpg",
          "./assets/images/Shop/Trinkspiele/Werlachtverliert/95.jpg",
        ]),
  ];
  final List<ProductClass> listBarQuartett = [
    ProductClass(
        productName: "Bar Quartett",
        description: "32 Locations - 64 Gutscheine - 224€ Sparen",
        url:
            "https://beerballer.com/produkt/bar-quartett-trinkspiel-gutscheinheft/",
        productPicturesPaths: [
          "./assets/images/Shop/Trinkspiele/BarQuartett/66.jpg",
          "./assets/images/Shop/Trinkspiele/BarQuartett/67.jpg",
          "./assets/images/Shop/Trinkspiele/BarQuartett/68.jpg",
          "./assets/images/Shop/Trinkspiele/BarQuartett/69.jpg",      
        ])
  ];

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
        "./assets/images/Shop/Icons/cart.png",
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
                  "Shotpong", "./assets/images/Shop/Icons/shotpong.png"),
              context,
              listShotpong)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Dare Pong", "./assets/images/Shop/Icons/darepong.png"),
              context,
              listDarePong)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>("Wer lacht verliert!",
                  "./assets/images/Shop/Icons/glasses.png"),
              context,
              listWrLachtVerliert)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Bar Quartett", "./assets/images/Shop/Icons/barQuartet.png"),
              context,
              listBarQuartett)),
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

Widget _shopMenuChoiceButton(Tuple2<String, String> gameChoice,
    BuildContext context, List<ProductClass> listProducts) {
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

class GameChoice {
  const GameChoice({this.title, this.id});
  final String title;
  final GameChoicheEnum id;
}

void _selectShopMenuChoice(Tuple2<String, String> choice, BuildContext context,
    List<ProductClass> listProducts) {
  switch (choice.item1) {
    case "Shotpong":
      {
        Navigator.push(
            context,
            CustomTransistionAnimation(
                page: ListOfProductsPage(
                    items: listProducts, //Here Array of Products
                    logPath: choice.item2,
                    pageTitle: choice.item1)));
      }
      break;
    case "Dare Pong":
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: ListOfProductsPage(
                  items: listProducts,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Wer lacht verliert!":
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: ListOfProductsPage(
                  items: listProducts,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Bar Quartett":
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: ListOfProductsPage(
                  items: listProducts,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    default:
      {
        print('route not found');
      }
      break;
  }
}
