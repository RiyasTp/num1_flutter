import 'package:flutter/material.dart';

class Game {
  static int tries = 0;
  static bool won = false;
  static bool inGame = true;
  static late String num1;

  Game() {
    var digits = List.generate(10, (i) => i);
    digits.shuffle();
    num1 = digits.sublist(0, 3).join();
    print(num1);
  }

  checkWin(String input) {
    Widget resultText = const SizedBox();
    if (tries < 5 && inGame) {
      resultText = checkNum(input);
      tries++;
      if (won) {
        return resultText = const Text(
          "You won!!",
          style: TextStyle(color: Colors.amber),
        );
      }
      if (tries > 4) {
        inGame = false;
      }
    }
    if (tries == 5 && !inGame) {
      resultText = Text(
        "You lose !! the number is $num1",
        style: const TextStyle(
          color: Colors.red,
        ),
      );
      tries++;
      return resultText;
    }
    return resultText;
  }

  Widget checkNum(String input) {
    String num1 = Game.num1;
    int wrongPlace = 0;
    int correctPlace = 0;
    Widget result = const SizedBox();

    String inputNum = input;

    if (num1 == inputNum) {
      Game.won = true;
      Game.inGame = false;
      return result;
    }
    for (var i = 0; i < 3; i++) {
      if (num1[i] == inputNum[i]) {
        correctPlace++;
        continue;
      }
      for (var j = 0; j < 3; j++) {
        if (num1[i] == inputNum[j]) wrongPlace++;
      }
    }

    result = RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: '$correctPlace',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 158, 34))),
          const TextSpan(
              text: ' numbers are correct and well placed \n',
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

    return result;
  }
}
