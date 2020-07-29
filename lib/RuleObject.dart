import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Questionclasses/Question.dart';
import 'package:testflutter/TypeOfQuestion.dart';

class RuleObject{
  
  //TypeOfQuestion typeOfQuestion;
  final String category;
  final String text;
  
  RuleObject({this.category, this.text});
  factory RuleObject.fromJson(Map<String, dynamic> json) {
    // String typeString = json['questiontype'] as String;
    // TypeOfQuestion type;
    return RuleObject(
      text: json['text'] as String,
      category: json['categiry'] as String,
    );
  }
}
