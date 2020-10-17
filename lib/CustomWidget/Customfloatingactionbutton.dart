import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/SizeConfig.dart';
import 'dart:math';

import 'package:testflutter/main.dart';

Widget Customfloatingactionbutton(myImage, ticketprovider, context) {
  AnimationController _controller;

  _controller = AnimationController(
      duration: Duration(seconds: 1), vsync: ticketprovider);

  return FractionallySizedBox(
    heightFactor: 0.13,
    widthFactor: 0.22,
    // height: SizeConfig.blockSizeVertical * 120.0,
    // width: SizeConfig.blockSizeHorizontal * 210,
    child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          //   if (_controller.isCompleted) {
          //     _controller.reset();
          //   }
          //   _controller.forward();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: new ConstrainedBox(
                  constraints: new BoxConstraints.expand(),
                  // child: new Image.asset("./assets/images/logo.png",
                  child: myImage),
            );
          },
          // child: FractionallySizedBox(
          //     widthFactor: 1.5,
          //     heightFactor: 1.5,
          //     child: FittedBox(
          //       fit: BoxFit.contain,
          //       child: FlutterLogo(),
          //     )
          // FlutterLogo(size: 200),
        )),
  );
}
