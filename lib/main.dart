import 'package:flutter/material.dart';
import 'package:myapp/answer.dart';
import './questions.dart';
import './result.dart';
import './survey.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> _result = [0, 0, 0];
  final _questions = [
    {
      "question": "ما نوع الأفلام التي تحبها؟",
      "answers": [
        {"answer": "كوميديا", "score": 4},
        {"answer": "أكشن", "score": 3},
        {"answer": "رعب", "score": 2},
        {"answer": "دراما", "score": 1},
      ],
    },
    {
      "question": "هل تحب الخيالية؟",
      "answers": [
        {"answer": "نعم", "score": 1},
        {"answer": "لا", "score": 0},
      ]
    },
    {
      "question": "هل تحب الأفلام القديمة أم الجديدة",
      "answers": [
        {"answer": "القديمة", "score": 2},
        {"answer": "الجديدة", "score": 1},
        {"answer": "كلاهما", "score": 0},
      ],
    }
  ];
  var _questionNumber = 0;
  void _buttonPressed(int score) {
    setState(() {
      if (_questionNumber == 0) {
        _result[0] += score;
      } else if (_questionNumber == 1) {
        _result[1] += score;
      } else if (_questionNumber == 2) {
        _result[2] += score;
      }

      _questionNumber++;
      print(_questionNumber);
    });
    print("Button pressed");
  }

  void _reset() {
    setState(() {
      _questionNumber = 0;
      _result = [0, 0, 0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Movie Recommendation System",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22),
          )),
        ),
        body: (_questionNumber != 3)
            ? Survey(_questions, _questionNumber, _buttonPressed)
            : Result(_result, this._reset),
      ),
    );
  }
}
