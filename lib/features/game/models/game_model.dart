import 'dart:math';

class Game {
  int _tries = 0;
  bool _won = false;
  bool _inGame = true;
  final int _maxTries = 5;
  late String _num1;

  Game() {
    _getRandomNum();
  }

  Game.repeatedNum({int length = 3}) {
    _getRandomInt(length);
  }

  bool get isInGame {
    if (_tries < _maxTries) {
      return _inGame;
    } else {
      return _inGame = false;
    }
  }

  void incrementTries() {
    _tries++;
  }

  get isGameWon {
    return _won;
  }

  String get num {
    return _num1;
  }

  clear() {
    _tries = 0;
    _won = false;
    _inGame = true;
    _getRandomNum();
  }

  makeGameWin() {
    _won = true;
    _inGame = false;
  }

  makeGameOver() {
    _inGame = false;
  }

  void _getRandomNum() {
    var digits = List.generate(10, (i) => i);
    digits.shuffle();
    _num1 = digits.sublist(0, 3).join();
  }

  String _getRandomInt(int length) {
    if (length < 3) length = 3;
    if (length > 5) length = 5;

    Random rnd = Random();
    int r = rnd.nextInt(1000);
    return _intToWord(r, length);
  }

  String _intToWord(int num, int length) {
    String s = num.toString();
    while (s.length < length) {
      s = "0$s";
    }
    return s;
  }
}
