import 'package:flutter/material.dart';
import './recommendation_system.dart';
import './movie.dart';

class Result extends StatelessWidget {
  final List<int> _result_List;
  final VoidCallback _reset;
  final _style = TextStyle(color: Colors.green, fontSize: 30);
  final _button_style =
      ElevatedButton.styleFrom(backgroundColor: Colors.green[500]);
  Result(@required this._result_List, @required this._reset);

  @override
  Widget build(BuildContext context) {
    Movie m = recommend(this._result_List);
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(m.getName(), style: this._style),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          m.getImage(),
          height: 300,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => {this._reset()},
          child: Text(
            "فيلم آخر",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          style: _button_style,
        )
      ],
    ));
  }
}
