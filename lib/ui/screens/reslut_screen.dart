import 'package:flutter/material.dart';

import 'homepage.dart';
import '../../logic.dart';

class ResultScreen extends StatelessWidget {
  List<String> playedNumbers;
  List<Widget> positons;
  ResultScreen({Key? key, required this.playedNumbers, required this.positons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return NumberBlocks(
            newNumber: playedNumbers[index],
            isActive: Game.tries - 1 == index ? true : false,
            validations: positons[index],
          );
        },
      ),
    ));
  }
}
