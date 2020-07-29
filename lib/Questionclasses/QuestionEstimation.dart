
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Questionclasses/Question.dart';

class QuestionEstimation extends Question{
  final String questionAnswer;
  bool isShowingAnswer = false;

  QuestionEstimation({questionText, this.questionAnswer}) : super(questionText: questionText);

  factory QuestionEstimation.fromJson(Map<String, dynamic> json) {
    return QuestionEstimation(
      questionText: json['text'] as String,
      questionAnswer : json['answer'] as String,
    );
  }
}