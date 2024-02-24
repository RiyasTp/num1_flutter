import 'package:flutter/material.dart';

class ResultValidatonWidget extends StatelessWidget {
  const ResultValidatonWidget({
    Key? key,
    required this.correctPlace,
    required this.wrongPlace,
  }) : super(key: key);

  final int correctPlace;
  final int wrongPlace;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: '$correctPlace',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green.shade700)),
          TextSpan(
              text: ' numbers are well placed \n',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade900)),
          TextSpan(
              text: '$wrongPlace',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange.shade700)),
          TextSpan(
              text: '  numbers are correct but wrongly placed',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey.shade900)),
        ]));
  }
}
