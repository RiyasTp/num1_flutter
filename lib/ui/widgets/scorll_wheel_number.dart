import 'package:flutter/material.dart';

class ScrolWheelNumber extends StatelessWidget {
  final String number;
  final Color selectedColor;
  final double fontSize;
  const ScrolWheelNumber({Key? key, required this.number,required this.selectedColor, this.fontSize=25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), 
            border: Border.all(color: Colors.blueAccent) 
          ), 
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
