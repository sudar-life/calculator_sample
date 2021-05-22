import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  final double display;
  const CalcDisplay({Key? key, required this.display}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayValue = display.toString();
    var fontSize = 80.0;
    if (display.toString().contains(".")) {
      var numbar = int.parse(display.toString().split('.')[0]);
      if (numbar - display == 0) {
        displayValue = numbar.toString();
      }
    }
    if (displayValue.length > 7) {
      fontSize = 50;
    }

    return Text(
      displayValue.toString(),
      style: TextStyle(fontSize: fontSize, color: Colors.white),
      textAlign: TextAlign.right,
    );
  }
}
