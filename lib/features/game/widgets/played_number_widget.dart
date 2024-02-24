import 'package:flutter/material.dart';

class PlayedNumberWidget extends StatelessWidget {
  final String number;
  final Color selectedColor;
  final double fontSize;
  const PlayedNumberWidget({
    Key? key,
    required this.number,
     this.selectedColor = Colors.black,
    this.fontSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:  15 , vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            
            border: Border.all(color: Colors.grey.shade900 , width: 1.5)),
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
