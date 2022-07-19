import 'package:flutter/material.dart';

import 'scrol_wheel.dart';

class NumScroll extends StatelessWidget {

  NumScroll({Key? key, required this.newNumber}) : super(key: key);
  final ValueChanged <String> newNumber;
  String inputNumber = '000';

  // Pass this method to the child page.
  void _update(Map inputNum) {
    String newNum = inputNum['number'];
    int pos = inputNum['pos'];
    inputNumber = replaceCharAt(inputNumber, pos, newNum);
    newNumber(inputNumber);
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScrollWheel(update: _update, pos: 0),
        const SizedBox(width: 5),
        ScrollWheel(update: _update, pos: 1),
        const SizedBox(width: 5),
        ScrollWheel(update: _update, pos: 2),
      ],
    );
  }
}
