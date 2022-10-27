class Game {
  int _tries = 0;
  bool _won = false;
  bool _inGame = true;
  final int _maxTries = 5;
  late String _num1;
  Game() {
    getRandomNum();
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
    getRandomNum();
  }

  makeGameWin() {
    _won = true;
    _inGame = false;
  }

  makeGameOver() {
    _inGame = false;
  }

  getRandomNum() {
    var digits = List.generate(10, (i) => i);
    digits.shuffle();
    _num1 = digits.sublist(0, 3).join();
  }
}
