
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

class Question {
  final String questionText;
  final String questionAnswer;
  bool isShowingAnswer = false;

  Question({this.questionText, this.questionAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['text'] as String,
      questionAnswer : json['answer'] as String,
    );
  }
}