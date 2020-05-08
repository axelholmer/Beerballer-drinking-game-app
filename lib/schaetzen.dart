import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import 'Question.dart';
//TODO add startpopup for rules and explaination for the UI.
//blanda staefull med stateless, kolla widget tutorial, inta sa viktigt.
//gor json
class Schaetzen extends StatefulWidget {
  final List<Question>
      listQuestions; //TODO se stateless for widget attributes, OBS NOt so important for this Route
  Question q;

  Schaetzen({Key key, @required this.listQuestions}) : super(key: key);

  @override
  _SchaetzenState createState() => _SchaetzenState();
}

class _SchaetzenState extends State<Schaetzen> {
  String currentText;
  void initState() {
    widget.q = getRandomQuestion();
    currentText = widget.q.questionText;
  }

//TODO fixa themedata
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schaetzen test'),
      ),
      body: _buildQuestion(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            widget.q = getRandomQuestion();
            currentText = widget.q.questionText;
          });
        },
        label: Text('Naechste Frage'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Question getRandomQuestion() {
    var rng = new Random();
    print(rng.nextInt(widget.listQuestions.length));
    return widget.listQuestions[rng.nextInt(widget.listQuestions.length)];
  }

  void toggleText() {
    if (widget.q.isShowingAnswer) {
      widget.q.isShowingAnswer = false;
      currentText = widget.q.questionText;
      print('funkar');
    } else {
      widget.q.isShowingAnswer = true;
      currentText = widget.q.questionAnswer;
    }
  }

  Widget _buildQuestion() {
    return InkWell(
      onTap: () {
        setState(() {
          toggleText();
        });
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentText,
            ),
          ],
        ),
      ),
    );
  }
}
