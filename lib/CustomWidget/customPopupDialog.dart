import 'package:flutter/material.dart';

Widget customPopupDialog(BuildContext context, String gameName, List<String> explList) {
    
    
    
    return new AlertDialog(
      title: Text(gameName), //fix Text size etc
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        //  _buildAboutText(),
          //_buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
}