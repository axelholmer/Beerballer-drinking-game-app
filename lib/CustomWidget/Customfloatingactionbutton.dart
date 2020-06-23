import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:testflutter/main.dart';

Widget Customfloatingactionbutton(myImage, ticketprovider) {
  AnimationController _controller;

  _controller = AnimationController(
      duration: Duration(seconds: 1), vsync: ticketprovider);

  return Container(
      height: 75.0,
      width: 75.0,
      child: FloatingActionButton(
        onPressed: () {
        if(_controller.isCompleted) {
          _controller.reset();
        }
          _controller.forward();
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
          child: FlutterLogo(size: 200),
        ),
      ));
}
