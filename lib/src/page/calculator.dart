import 'package:calculator_sample/src/components/calc_button.dart';
import 'package:calculator_sample/src/components/calc_disply.dart';
import 'package:calculator_sample/src/constants/button_type.dart';
import 'package:calculator_sample/src/model/calc_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  double x;
  double y;
  Calculator({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Size? size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  double display = 0;

  String x = "";
  String y = "";
  String oper = "";
  List<String> stackValues = [];

  List<CalcButton> buttonList = [
    CalcButton("AC", CalcType.ETC),
    CalcButton("+/-", CalcType.ETC),
    CalcButton("%", CalcType.ETC),
    CalcButton("÷", CalcType.Operator),
    CalcButton("7", CalcType.Number),
    CalcButton("8", CalcType.Number),
    CalcButton("9", CalcType.Number),
    CalcButton("x", CalcType.Operator),
    CalcButton("4", CalcType.Number),
    CalcButton("5", CalcType.Number),
    CalcButton("6", CalcType.Number),
    CalcButton("-", CalcType.Operator),
    CalcButton("1", CalcType.Number),
    CalcButton("2", CalcType.Number),
    CalcButton("3", CalcType.Number),
    CalcButton("+", CalcType.Operator),
    CalcButton("0", CalcType.Number),
    CalcButton(".", CalcType.Number),
    CalcButton("=", CalcType.Operator),
  ];

  void _operatorEvent(String operatorValue) {
    calcResult();
    if (operatorValue != '=') oper = operatorValue;
    setState(() {
      switch (operatorValue) {
        case "÷":
        case "x":
        case "-":
        case "+":
          if (y != "") {
            y = display.toString();
          } else {
            y = x;
          }
          break;
        case "=":
          calcResult();
          break;
      }
      x = "";
    });
  }

  void calcResult() {
    setState(() {
      if (x == "") {
        x = y;
        y = display.toString();
      }
      switch (oper) {
        case "÷":
          display = double.parse(y) / double.parse(x);
          break;
        case "x":
          display = double.parse(y) * double.parse(x);
          break;
        case "-":
          display = double.parse(y) - double.parse(x);
          break;
        case "+":
          display = double.parse(y) + double.parse(x);
          break;
      }
      oper = "=";
      x = "";
      y = display.toString();
    });
  }

  void initData() {
    display = 0;
    y = "";
    x = "";
    oper = "";
  }

  void _etcEvent(String etcValue) {
    setState(() {
      switch (etcValue) {
        case "%":
          if (x != '') display = double.parse(x);
          display /= 100;
          y = display.toString();
          x = '';
          break;
        case "AC":
          initData();
          break;
        case "+/-":
          display *= -1;
          x = '';
          break;
      }
    });
  }

  void buttonEvent(CalcButton calcButton) {
    switch (calcButton.theme) {
      case CalcType.Operator:
        _operatorEvent(calcButton.text);
        break;
      case CalcType.Number:
        setState(() {
          if (oper == "=") {
            y = "";
          }
          var calcText = calcButton.text;
          if (calcButton.text == "." && x.contains('.')) {
            calcText = "";
          }
          x += calcText;
          display = double.parse(x);
        });
        break;
      case CalcType.ETC:
        _etcEvent(calcButton.text);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 250,
            child: Align(
              alignment: Alignment.bottomRight,
              child: CalcDisplay(display: display),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GridView.builder(
                  padding: const EdgeInsets.all(5.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttonList.length,
                  itemBuilder: (_, index) {
                    return CalcButtonWidget(
                      onTap: () {
                        buttonEvent(buttonList[index]);
                      },
                      calcButton: buttonList[index],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
