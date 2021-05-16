import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  double x;
  double y;
  Calculator({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double result = 0;
  double add() {
    print("${widget.x}+${widget.y}=${widget.x + widget.y}");
    return widget.x + widget.y;
  }

  double subtract() {
    print("${widget.x}-${widget.y}=${widget.x - widget.y}");
    return widget.x - widget.y;
  }

  double multiplication() {
    print("${widget.x}*${widget.y}=${widget.x * widget.y}");
    return widget.x * widget.y;
  }

  double division() {
    print("${widget.x}/${widget.y}=${widget.x / widget.y}");
    return widget.x / widget.y;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                result.toString(),
                style: TextStyle(fontSize: 80),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  double value = add();
                  setState(() {
                    result = value;
                  });
                },
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 60),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double value = subtract();
                  setState(() {
                    result = value;
                  });
                },
                child: Text(
                  "-",
                  style: TextStyle(fontSize: 60),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double value = multiplication();
                  setState(() {
                    result = value;
                  });
                },
                child: Text(
                  "X",
                  style: TextStyle(fontSize: 60),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double value = division();
                  setState(() {
                    result = value;
                  });
                },
                child: Text(
                  "/",
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
