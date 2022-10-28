import 'package:flutter/cupertino.dart';
import 'package:num1/features/game/models/result_model.dart';
import 'package:num1/features/game/repo_services/game_services.dart';

class GameProvider extends ChangeNotifier {
  final GameServices _gameServices = GameServices();
  String lastInput = '000';
  int currentTry = 0;
  List<String> playedNumbers = ['000', '000', '000', '000', '000', '000', ''];

  _updateLastInput(String input) {
    playedNumbers[currentTry] = input;
    lastInput = input;
    currentTry++;
    notifyListeners();
  }

  _handleResult(Result result) {
    String status = result.status;
    switch (status) {
      case "won":
        print('you won. Number is ${result.number}');
        break;
      case "lost":
        print('you lost. Number is ${result.number}');

        break;
      case "inGame":
        print(
            '${result.correctPlace} numbers are correct and well placed \n${result.wrongPlace} numbers are correct but wrongly placed');

        break;
      default:
        print('unknown error');
    }
  }

  onPlayed(String value) {
    if (playedNumbers.contains(value)) {
      print('This number is already tried!! Try another one');
      return;
    }
    if (currentTry < playedNumbers.length) {
      final result = _gameServices.getResult(value);
      if (result != null) {
        _handleResult(result);
      }
      _updateLastInput(value);
      return;
    }
  }

  onResetGame() {
    lastInput = '000';
    currentTry = 0;
    playedNumbers = ['000', '000', '000', '000', '000', '000', ''];
    _gameServices.resetGame();
    notifyListeners();
  }
}
