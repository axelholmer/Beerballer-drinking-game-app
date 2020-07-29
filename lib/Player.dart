import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';


class Player {
   Player(){
this.name = 'Kevin'; //lagg till wollnys
   }
  Player.fromStart({this.name});
  String name;
  bool hasName = false; //TODO fix blacktext when name is inputed, also need confirmation to only play when player have inputed name
}