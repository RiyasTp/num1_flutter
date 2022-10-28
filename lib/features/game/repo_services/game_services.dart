import 'package:num1/features/game/models/game_model.dart';
import 'package:num1/features/game/models/result_model.dart';

class GameServices {
  final int _length = 3;
  final Game _game = Game();

  resetGame() {
    _game.clear();
  }

  Result getResult(String value) {
    int wrongPlace = 0;
    int correctPlace = 0;
    String num1 = _game.num;
    if (value == num1) {
      _game.makeGameWin();
      return Result(status: "won", number: num1);
    }
    _game.incrementTries();
    if (!_game.isInGame) {
      return Result(status: "lost", number: num1);
    }

    for (var i = 0; i < _length; i++) {
      if (num1[i] == value[i]) {
        correctPlace++;
        continue;
      }
      for (var j = 0; j < _length; j++) {
        if (num1[i] == value[j]) wrongPlace++;
      }
    }

    return Result(
      status: "inGame",
      wrongPlace: wrongPlace,
      correctPlace: correctPlace,
    );
  }
}
