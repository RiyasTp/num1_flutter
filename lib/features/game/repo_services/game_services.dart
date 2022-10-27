import 'package:num1/features/game/models/game_model.dart';

class GameServices {
  final Game _game = Game();

  restGame(){
    
  }

  getResult(String value) {
    int wrongPlace = 0;
    int correctPlace = 0;
    String num1 = _game.num;
    if (value == num1) {
      _game.makeGameWin();
      return {"status": "won", "number": _game.num};
    }
    _game.incrementTries();
    if (!_game.isInGame) {
      return {"status": "lost", "number": _game.num};
    }

    for (var i = 0; i < 3; i++) {
      if (num1[i] == value[i]) {
        correctPlace++;
        continue;
      }
      for (var j = 0; j < 3; j++) {
        if (num1[i] == value[j]) wrongPlace++;
      }
    }

    return {
      "status": "inGame",
      "wrongPlace": '$wrongPlace',
      "correctPlace": '$correctPlace'
    };
  }

}
