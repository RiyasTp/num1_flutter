// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:num1/features/game/models/result_model.dart';
import 'package:num1/features/game/repo_services/game_services.dart';

class GameProvider extends ChangeNotifier {
  final GameServices _gameServices = GameServices();
  String lastInput = '000';

  List<String> playedNumbers = [];
  final List<Result> _results = [];

  bool get isGameOver {
    return !_gameServices.isInGame;
  }

  List<Result> get results {
    return _results;
  }

  void updateOnScroll(Map inputNum) {
    String newNum = inputNum['number'];
    int pos = inputNum['pos'];
    lastInput = _replaceCharAt(lastInput, pos, newNum);
    notifyListeners();
  }

  String _replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  _updatePlayedNumbers(String input) {
    lastInput = input;
    notifyListeners();
  }

  _updateLastInput(String input) {
    playedNumbers.add(input);
    lastInput = input;

    _updatePlayedNumbers(input);
  }

  _handleResult(Result result) {
    _results.add(result);
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

  onPlayed() {
    final value = lastInput;
    print('pressed');
    if (playedNumbers.contains(value)) {
      print('This number is already tried!! Try another one');
      return;
    }
    if (_gameServices.isInGame) {
      final result = _gameServices.getResult(value);
      _handleResult(result);
      _updateLastInput(value);
      print(playedNumbers);
      return;
    }
  }
  

  void onResetGame() {
    // final navigator = Navigator()
    lastInput = '000';
    playedNumbers.clear();
    _results.clear();
    print('length is ${_results.length}'); 
    _gameServices.resetGame();
    notifyListeners();
  }
}
