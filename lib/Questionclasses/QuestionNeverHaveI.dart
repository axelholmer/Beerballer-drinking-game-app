


import 'Question.dart';

class QuestionNeverHaveI extends Question{
 
  QuestionNeverHaveI({questionText}) : super(questionText: questionText);

  factory QuestionNeverHaveI.fromJson(Map<String, dynamic> json) {
    return QuestionNeverHaveI(
      questionText: json['text'] as String,
    );
  }
}