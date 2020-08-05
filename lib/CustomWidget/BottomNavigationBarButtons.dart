import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testflutter/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO fix sizes here
Widget BottomNavigationBarButtons(BuildContext context) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: Container(
      //color: Theme.of(context).accentColor,
      height: SizeConfig.blockSizeVertical *9.0,
      child: Row /*or Column*/ (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: SizeConfig.safeBlockHorizontal * 8.0,
            icon: Icon(FontAwesomeIcons.info),
            onPressed: () {},
          ),
          IconButton(
            iconSize: SizeConfig.safeBlockHorizontal * 8.0,
            icon: Icon(FontAwesomeIcons.shopify),
            onPressed: _launchURLShop,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 27,
          ),
          IconButton(
            iconSize:  SizeConfig.safeBlockHorizontal * 8.0,
            icon: Icon(FontAwesomeIcons.instagram),
            onPressed: _launchURLInsta,
          ),
          IconButton(
            iconSize:  SizeConfig.safeBlockHorizontal * 8.0,
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: _launchURLFacebook,
          ),
        ],
      ),
    ),
  );
}

_launchURLInsta() async {
  final url = 'https://www.instagram.com/beerballer/?hl=en';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//Todo implement this method with all the other buttons, parameter says what to do
_launchURLShop() async {
  final url = 'https://beerballer.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//Todo implement this method with all the other buttons, parameter says what to do
_launchURLFacebook() async {
  final url = 'https://www.facebook.com/BeerBaller/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}