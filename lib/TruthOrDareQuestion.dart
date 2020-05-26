
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';

class TruthOrDareQuestion {
  final String questionText;
  final String typeOfQuestion;


  TruthOrDareQuestion({this.questionText,this.typeOfQuestion});

  factory TruthOrDareQuestion.fromJson(Map<String, dynamic> json) {
    return TruthOrDareQuestion(
      questionText: json['text'] as String,
      typeOfQuestion : json['questiontype'] as String,
    );
  }
}