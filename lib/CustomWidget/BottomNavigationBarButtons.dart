import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget BottomNavigationBarButtons(BuildContext context) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: Container(
      //color: Theme.of(context).accentColor,
      height: 60.0,
      child: Row /*or Column*/ (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.info),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.shopify),
            onPressed: _launchURLShop,
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(FontAwesomeIcons.instagram),
            onPressed: _launchURLInsta,
          ),
          IconButton(
            iconSize: 40.0,
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