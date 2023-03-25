import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Survey extends StatelessWidget {
  final _questions;
  final _questionNumber;
  final Function _buttonPressed;
  Survey(@required this._questions, @required this._questionNumber,
      @required this._buttonPressed);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Center(
          child: Question(
            _questions[_questionNumber]["question"] as String,
          ),
        ),
        ...(_questions[_questionNumber]["answers"] as List<Map>)
            .map((answer_text) {
          return Answer(() => this._buttonPressed(answer_text["score"]),
              answer_text["answer"] as String);
        }).toList()
      ],
    );
  }
}
