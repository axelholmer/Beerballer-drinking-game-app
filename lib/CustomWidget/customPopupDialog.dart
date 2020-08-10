import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/CustomExplItemTest.dart';
import 'package:testflutter/SizeConfig.dart';

Widget customPopupDialog(
    BuildContext context, String gameName, List<String> explList) {
  List<Widget> listWidgets = List<Widget>();

  for (var item in explList) {
    if (item != "") {
      listWidgets.add(CustomExplItemTest(context, item));
      // listWidgets.add(SizedBox(
      //   height: SizeConfig.blockSizeVertical * 1,
      // ));
    }
  }

  return new AlertDialog(
    backgroundColor: Theme.of(context).primaryColor,
    insetPadding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 40),
    contentPadding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 35),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    title: Text(
      gameName,
      textAlign: TextAlign.start,
    
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal * 6,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(238, 237, 237, 1),
      ),
    ), //fix Text size etc
    content: Container(
        width: SizeConfig.safeBlockHorizontal * 400,
        height: SizeConfig.safeBlockVertical * 650,
        child: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
                //Here a widget list of Texts

                child: Center(
                    child: Container(
              color: Color.fromRGBO(50, 50, 50, 1),
              child: Column(children: listWidgets
                  //  CustomExplItemTest(context, "terrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrffffffffffffffst"),
                  //  SizedBox(height: SizeConfig.blockSizeVertical * 40,),
                  //  CustomExplItemTest(context, "terrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrffffffffffffffst"),

                  ),
            ))),
          ),
        )),

    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Colors.orange[200],
        child: const Text('Okay, got it!'),
      ),
    ],
  );
}
