import 'package:flutter/cupertino.dart';
import 'package:num1/features/game/repo_services/game_services.dart';

class GameProvider extends ChangeNotifier {
  final GameServices gameServices = GameServices();
  String lastInput ='000';
  int currentTry = 0;
  List<String> playedNumbers = ['000', '000', '000', '000', '000', '000', ''];

  updateLastInput(String input){
    playedNumbers[currentTry] = input;
    lastInput = input;
    currentTry++;
    notifyListeners();
  }
  onPlayed(){

  }
}