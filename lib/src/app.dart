import 'package:calculator_sample/src/page/calculator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calculator(x: 10, y: 2),
    );
  }
}
