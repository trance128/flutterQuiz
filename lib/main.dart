import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 5},
        {'text': 'White', 'score': 10},
      ],
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'llama', 'score': 7},
        {'text': 'puppy', 'score': 10},
        {'text': 'kitten', 'score': 3},
        {'text': 'alpaca', 'score': 0},
      ]
    },
    {
      'questionText': "Who's your favourite person?",
      'answers': [
        {'text': 'Ovid', 'score': 7},
        {'text': 'Ov', 'score': 5},
        {'text': 'Ovidius', 'score': 10},
        {'text': 'Ovidius M', 'score': 10},
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("Answer chosen!");

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Another Hello World"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
