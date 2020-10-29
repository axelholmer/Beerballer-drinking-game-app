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

class _ShopBeerPongEquipmentMenuPageState
    extends State<ShopBeerPongEquipmentMenuPage> with TickerProviderStateMixin {
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
  final List<ProductClass> listBeerPongTablesProducts = [
    ProductClass(
        productName: "Allblack",
        description: "Schwarz wie die Nacht",
        url:
            "https://beerballer.com/produkt/beer-pong-tisch-allblack-beerballer/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Tische/Allblack/44.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/45.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/46.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/47.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/48.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/49.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/50.jpg",
          "./assets/images/Shop/BeerPong/Tische/Allblack/51.jpg",
        ]),
    ProductClass(
        productName: "LED Tisch",
        description: "Auch im Dunkeln, der Hellste",
        url: "https://beerballer.com/produkt/beer-pong-tisch-led-beerballer/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/52.jpg",
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/53.jpg",
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/54.jpg",
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/55.jpg",
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/56.jpg",
          "./assets/images/Shop/BeerPong/Tische/LEDTisch/57.jpg"
        ]),
    ProductClass(
        productName: "Wood n Ice Tisch",
        description: "Mit Kühlfach und Becherhaltern",
        url:
            "https://beerballer.com/produkt/beer-pong-tisch-wood-n-ice-beerballer/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/58.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/59.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/60.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/61.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/62.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/63.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/64.jpg",
          "./assets/images/Shop/BeerPong/Tische/WoodNIce/65.jpg"
        ])
  ];
  final List<ProductClass> listBallsProducts = [
    ProductClass(
        productName: "Bälle",
        description: "Im praktischen 50er Pack",
        url:
            "https://beerballer.com/produkt/beer-pong-baelle-beerballer-50stueck/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Bälle/1.jpg",
          "./assets/images/Shop/BeerPong/Bälle/2.jpg",
          "./assets/images/Shop/BeerPong/Bälle/3.jpg",
          "./assets/images/Shop/BeerPong/Bälle/4.jpg"
        ])
  ];
  final List<ProductClass> listCupsProducts = [
    ProductClass(
        productName: "Red Cups",
        description: "Die Original Americans",
        url:
            "https://beerballer.com/produkt/beer-pong-cups-rot-beerballer-red-cups/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/RedCups/23.jpg",
          "./assets/images/Shop/BeerPong/Becher/RedCups/24.jpg",
          "./assets/images/Shop/BeerPong/Becher/RedCups/25.jpg",
          "./assets/images/Shop/BeerPong/Becher/RedCups/26.jpg",
          "./assets/images/Shop/BeerPong/Becher/RedCups/27.jpg",
          "./assets/images/Shop/BeerPong/Becher/RedCups/28.jpg"
        ]),
    ProductClass(
        productName: "Blue Cups",
        description: "Die Blaumacher",
        url:
            "https://beerballer.com/produkt/beer-pong-becher-blau-beerballer-blue-cups/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/BlueCups/11.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlueCups/12.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlueCups/13.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlueCups/14.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlueCups/15.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlueCups/16.jpg"
        ]),
    ProductClass(
        productName: "Pink Cups",
        description: "Die Girly Edition",
        url:
            "https://beerballer.com/produkt/beer-pong-cups-rot-beerballer-pink-cups/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/PinkCups/17.jpg",
          "./assets/images/Shop/BeerPong/Becher/PinkCups/18.jpg",
          "./assets/images/Shop/BeerPong/Becher/PinkCups/19.jpg",
          "./assets/images/Shop/BeerPong/Becher/PinkCups/20.jpg",
          "./assets/images/Shop/BeerPong/Becher/PinkCups/21.jpg",
          "./assets/images/Shop/BeerPong/Becher/PinkCups/22.jpg"
        ]),
    ProductClass(
        productName: "Black Cups",
        description: "Die Eleganten",
        url:
            "https://beerballer.com/produkt/beer-pong-cups-rot-beerballer-black-cups/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/BlackCups/5.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlackCups/6.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlackCups/7.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlackCups/8.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlackCups/9.jpg",
          "./assets/images/Shop/BeerPong/Becher/BlackCups/10.jpg"
        ]),
    ProductClass(
        productName: "Yellow Cups",
        description: "Die Sommerlichen",
        url:
            "https://beerballer.com/produkt/beer-pong-cups-rot-beerballer-yellow-cups/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/YellowCups/32.jpg",
          "./assets/images/Shop/BeerPong/Becher/YellowCups/33.jpg",
          "./assets/images/Shop/BeerPong/Becher/YellowCups/34.jpg",
          "./assets/images/Shop/BeerPong/Becher/YellowCups/35.jpg",
          "./assets/images/Shop/BeerPong/Becher/YellowCups/36.jpg",
          "./assets/images/Shop/BeerPong/Becher/YellowCups/37.jpg"
        ]),
    ProductClass(
        productName: "Shot Cups",
        description: "Die Kleinen",
        url:
            "https://beerballer.com/produkt/shotpong-becher-red-beerballer-original/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Becher/ShotCups/29.jpg",
          "./assets/images/Shop/BeerPong/Becher/ShotCups/30.jpg",
          "./assets/images/Shop/BeerPong/Becher/ShotCups/31.jpg"
        ]),
  ];
  final List<ProductClass> listCarpetProducts = [
    ProductClass(
        productName: "Matte",
        description: "Das All-In-One Paket",
        url:
            "https://beerballer.com/produkt/beer-pong-matte-beer-baller-trinkspielset/",
        productPicturesPaths: [
          "./assets/images/Shop/BeerPong/Matte/38.jpg",
          "./assets/images/Shop/BeerPong/Matte/39.jpg",
          "./assets/images/Shop/BeerPong/Matte/40.jpg",
          "./assets/images/Shop/BeerPong/Matte/41.jpg",
          "./assets/images/Shop/BeerPong/Matte/42.jpg",
          "./assets/images/Shop/BeerPong/Matte/43.jpg"
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
        "Beer Pong",
        "./assets/images/Shop/Icons/cart.png",
      ),

      SizedBox(
        //always need this for title screens
        height: SizeConfig.blockSizeVertical * 50,
      ),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Tische", "./assets/images/Shop/Icons/beerpongtable.png"),
              context,
              listBeerPongTablesProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Bälle", "./assets/images/Shop/Icons/balls.png"),
              context,
              listBallsProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Becher", "./assets/images/Shop/Icons/cups.png"),
              context,
              listCupsProducts)),
      Flexible(
          child: FractionallySizedBox(
        heightFactor: 0.25,
      )),
      Flexible(
          child: _shopMenuChoiceButton(
              Tuple2<String, String>(
                  "Matte", "./assets/images/Shop/Icons/carpet.png"),
              context,
              listCarpetProducts)),
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
void _selectShopMenuChoice(Tuple2<String, String> choice, BuildContext context,
    List<ProductClass> listProducts) {
  switch (choice.item1) {
    case "Tische":
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
    case "Bälle":
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: ListOfProductsPage(
                  items: listProducts,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Becher":
      Navigator.push(
          context,
          CustomTransistionAnimation(
              page: ListOfProductsPage(
                  items: listProducts,
                  logPath: choice.item2,
                  pageTitle: choice.item1)));
      break;
    case "Matte":
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
