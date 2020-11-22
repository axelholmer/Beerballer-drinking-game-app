import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/CustomExplItemTest.dart';
import 'package:testflutter/SizeConfig.dart';

Widget popupDialogWarning(BuildContext context) {
  return WillPopScope(
      onWillPop: () {},
      child: AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        insetPadding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 40),
        contentPadding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        title: Text(
          "Warning",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 6,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(238, 237, 237, 1),
          ),
        ), //fix Text size etc
        content: Container(
            color: Color.fromRGBO(50, 50, 50, 1),
            width: SizeConfig.safeBlockHorizontal * 400,
            height: SizeConfig.safeBlockVertical * 650,
            child: SafeArea(
              child: Scrollbar(
                child: SingleChildScrollView(
                    child: Center(
                        child: Container(
                  // color: Color.fromRGBO(50, 50, 50, 1),
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.5),
                  child: Text(
                      "Wenn ihr auf OK drückt, dann bestätigt ihr über die App informiert zu sein. Ab diesem Zeitpunkt liegt die volle Verantwortung bei euch. BeerBaller übernimmt keine Verantwortung für die Konsequenzen, die durch die Nutzung der App entstehen könnten. Alkohol ist gesundheitsschädigend und sollte daher nur in moderaten Mengen konsumiert werden. Achtet aufeinander und wenn jemand nicht trinken will, dann muss er das auch nicht. Und am allerwichtigsten: Trinkt nicht, wenn ihr Auto fährt.",
                      textAlign: TextAlign.start,
                      style: new TextStyle(
                          // color: Theme.of(context).accentColor,
                          color: Color.fromRGBO(238, 237, 237, 1),
                          //   fontSize: 50.0,
                          fontWeight: FontWeight.w300,
                          height: SizeConfig.safeBlockHorizontal * 0.4,
                          fontSize: SizeConfig.safeBlockHorizontal * 4)),
                ))),
              ),
            )),

        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Colors.orange[200],
            child: const Text('OK'),
          ),
        ],
      ));
}
