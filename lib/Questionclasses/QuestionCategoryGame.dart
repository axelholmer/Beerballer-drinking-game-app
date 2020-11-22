import 'Question.dart';

class QuestionCategoryGame extends Question{
 
  QuestionCategoryGame({questionText, this.questionTextBackside}) : super(questionText: questionText);
    
    final String questionTextBackside;
  factory QuestionCategoryGame.fromJson(Map<String, dynamic> json) {
    return QuestionCategoryGame(
      questionText: json['text'] as String,
      questionTextBackside: json['textBackside'] as String,
    );
  }
}