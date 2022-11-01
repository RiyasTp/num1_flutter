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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 158, 34))),
          const TextSpan(
              text: ' numbers are well placed \n',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 172, 172, 172))),
          TextSpan(
              text: '$wrongPlace',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 158, 12))),
          const TextSpan(
              text: '  numbers are correct but wrongly placed',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 172, 172, 172))),
        ]));
  }
}
