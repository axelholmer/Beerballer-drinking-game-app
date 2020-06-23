import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:testflutter/Questionclasses/Question.dart';
import 'package:testflutter/TypeOfQuestion.dart';

class TruthOrDareQuestion extends Question {
  
  //final String typeOfQuestion;
  TypeOfQuestion typeOfQuestion;
 
  
  TruthOrDareQuestion({questionText, this.typeOfQuestion}) : super(questionText: questionText);

  factory TruthOrDareQuestion.fromJson(Map<String, dynamic> json) {
    String typeString = json['questiontype'] as String;
    TypeOfQuestion type;

    if (typeString == "truth") {
      type = TypeOfQuestion.truth;
    } else if (typeString == "dare") {
      type = TypeOfQuestion.dare;
    } else {
      print("ErrorNOTYPE"); //TODO LOG here
    }

    return TruthOrDareQuestion(
      questionText: json['text'] as String,
      typeOfQuestion: type,
    );
  }
}
