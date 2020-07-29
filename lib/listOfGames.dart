import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp(
//     items: List<String>.generate(10000, (i) => "Item $i"),
//   ));
// }

class listOfGames extends StatelessWidget {
  final List<String> items;

  listOfGames({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}
