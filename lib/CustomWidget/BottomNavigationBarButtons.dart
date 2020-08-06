import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testflutter/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO fix sizes here
Widget BottomNavigationBarButtons(BuildContext context) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: FractionallySizedBox(
      //color: Theme.of(context).accentColor,
      heightFactor: 0.07,
      // SizeConfig.blockSizeVertical *60.0,
      child: Row /*or Column*/ (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: FractionallySizedBox(
            widthFactor: 1.25,
            heightFactor: 1.25,
            child: FittedBox(
              
              fit: BoxFit.contain,
              child: IconButton(
                //iconSize: SizeConfig.safeBlockHorizontal * 80.0,
                icon: Icon(FontAwesomeIcons.info),
                onPressed: () {},
              ),
            ),
          )),
          Expanded(
              child: FractionallySizedBox(
            widthFactor: 1.25,
            heightFactor: 1.25,
            child: FittedBox(
              //alignment: Alignment.centerLeft,
              fit: BoxFit.contain,
              child: IconButton(
                // iconSize: SizeConfig.safeBlockHorizontal * 80.0,
                icon: Icon(FontAwesomeIcons.shopify),
                onPressed: _launchURLShop,
              ),
            ),
          )),

          // Flexible(
          //   fit: FlexFit.loose,
          //   child: FractionallySizedBox(
          //     widthFactor: 1,
          //   ),
          // ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 250,
          ),
          Expanded(
            child: FractionallySizedBox(
                widthFactor: 1.25,
                heightFactor: 1.25,
                child: FittedBox(
                  //alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: IconButton(
                    //  iconSize:  SizeConfig.safeBlockHorizontal * 80.0,
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: _launchURLInsta,
                  ),
                )),
          ),
          Expanded(
              child: FractionallySizedBox(
            widthFactor: 1.25,
            heightFactor: 1.25,
            child: FittedBox(
              //alignment: Alignment.centerLeft,
              fit: BoxFit.contain,
              child: IconButton(
                //  iconSize:  SizeConfig.safeBlockHorizontal * 80.0,
                icon: Icon(FontAwesomeIcons.facebook),
                onPressed: _launchURLFacebook,
              ),
            ),
          ))
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
