import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;
  final Function reset;

  Result(this.resultScore, this.reset);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'Not doing so great, eh?';
    } else if (resultScore <= 16) {
      resultText = 'You have decent taste';
    } else if (resultScore <= 25) {
      resultText = "Wow.  You pretty damn awesome";
    } else {
      resultText =
          "My god you sexy piece of man meat you.\nDayum you too awesome for words";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: reset,
          )
        ],
      ),
    );
  }
}
