import 'package:flutter/material.dart';
import './questions.dart';

class Answer extends StatelessWidget {
  final Function _handle;
  final String _answer_text;
  final style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  Answer(this._handle, this._answer_text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        child: ElevatedButton(
          style: this.style,
          onPressed: () => {_handle()},
          child: Text(
            this._answer_text,
          ),
        ),
      ),
    );
  }
}
