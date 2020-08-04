import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/GameCustomListItem.dart';
import 'package:testflutter/GameClass.dart';

import 'CustomWidget/CustomBackButton.dart';
import 'SizeConfig.dart';

// void main() {
//   runApp(MyApp(
//     items: List<String>.generate(10000, (i) => "Item $i"),
//   ));
// }

class listOfGames extends StatelessWidget {
  final List<GameClass> items;
  final String logPath;
  final String pageTitle;

  listOfGames({Key key, @required this.items, this.logPath, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeVertical * 5,
            ),
            Row(children: <Widget>[
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              CustomBackButton(context),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pageTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 8,
                    color: Color.fromRGBO(238, 237, 237, 1),
                     fontWeight: FontWeight.w900,
                  ),
                ),
                Image.asset(
                  logPath,
                  //width: SizeConfig.blockSizeHorizontal * ,
                  height: SizeConfig.blockSizeVertical * 8,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GameCustomListItem(context, gameClass: items[index]);
                  // return ListTile(
                  //  // title: Text('${items[index]}'),
                  // );
                },
              ),
            ),
          ],
        ));
  }
}
