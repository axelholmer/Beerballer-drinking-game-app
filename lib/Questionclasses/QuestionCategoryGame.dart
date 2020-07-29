import 'Question.dart';

class QuestionCategoryGame extends Question{
 
  QuestionCategoryGame({questionText}) : super(questionText: questionText);

  factory QuestionCategoryGame.fromJson(Map<String, dynamic> json) {
    return QuestionCategoryGame(
      questionText: json['text'] as String,
    );
  }
}