import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreen2.dart';
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

  listOfGames({Key key, @required this.items, this.logPath, this.pageTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.blockSizeVertical * 35,
            ),
           CustomTopTitleScreen2(context, pageTitle, logPath),
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
