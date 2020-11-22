import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/CustomTopTitleScreen2.dart';
import 'package:testflutter/CustomWidget/GameCustomListItem.dart';
import 'package:testflutter/GameClass.dart';
import 'package:testflutter/ShopPages/ProductListItem.dart';
import '../SizeConfig.dart';
import 'ProductClass.dart';

// void main() {
//   runApp(MyApp(
//     items: List<String>.generate(10000, (i) => "Item $i"),
//   ));
// }

class ListOfProductsPage extends StatelessWidget {
  final List<ProductClass> items;
  final String logPath;
  final String pageTitle;

  ListOfProductsPage({Key key, @required this.items, this.logPath, this.pageTitle})
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
                child: SafeArea(
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ProductListItem(context, product: items[index]);
                    // return ListTile(
                    //  // title: Text('${items[index]}'),
                    // );
                  },
                ),
              ),
            ))
          ],
        ));
  }
}
