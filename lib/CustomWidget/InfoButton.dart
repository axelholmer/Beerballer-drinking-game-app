import 'package:flutter/material.dart';
import 'package:testflutter/CustomWidget/InAppGamesPopupDialogs/CustomInfoPopupDialogEstimate.dart';
import '../SizeConfig.dart';

typedef void HideInfoExpl();
Widget InfoButton(BuildContext context, HideInfoExpl hideInfoExpl) {
  return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      //padding: EdgeInsets.all(0),
      color: Theme.of(context).accentColor,
      //iconSize: SizeConfig.blockSizeVertical * 5,
      icon: Icon(Icons.info_outline),
      onPressed: () {
        hideInfoExpl();
      });
}
