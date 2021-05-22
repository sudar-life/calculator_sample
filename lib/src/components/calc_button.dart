import 'package:calculator_sample/src/constants/button_type.dart';
import 'package:calculator_sample/src/model/calc_button.dart';
import 'package:flutter/material.dart';

class CalcButtonWidget extends StatelessWidget {
  final Function() onTap;
  final CalcButton calcButton;

  const CalcButtonWidget({
    Key? key,
    required this.onTap,
    required this.calcButton,
  }) : super(key: key);

  Color backgroundColor() {
    switch (calcButton.theme) {
      case CalcType.Operator:
        return Color(0xffff9e0a);
      case CalcType.Number:
        return Color(0xff333333);
      case CalcType.ETC:
        return Color(0xff8e8e93);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: double.infinity,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor()),
        child: Center(
          child: Text(
            calcButton.text,
            style: TextStyle(
                color: calcButton.theme == CalcType.ETC
                    ? Colors.black
                    : Colors.white,
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}
