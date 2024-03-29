import 'package:flutter/material.dart';

class ScrolWheelNumberWidget extends StatelessWidget {
  final String number;
  final Color selectedColor;
  final double fontSize;
  const ScrolWheelNumberWidget({
    Key? key,
    required this.number,
    required this.selectedColor ,
    this.fontSize = 23,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15.0, 0,15,8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color:selectedColor,width: 2)),
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: fontSize,
            color: selectedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
