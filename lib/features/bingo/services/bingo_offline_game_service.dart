import 'dart:developer';

import 'package:num1/features/bingo/models/bingo_game_model.dart';
import 'package:num1/features/bingo/models/tile_state_model.dart';
import 'package:num1/features/bingo/services/bingo_game_services.dart';

class BingoOfflineGameService extends BingoGameServices {
  final BingoGameModel _gameModel;
  final BingoGameModel _opGameModel;
  BingoGameStatus _gameStatus = BingoGameStatus.inGame;

  BingoOfflineGameService(List<InGameTileDataModel> tileDataList)
      : _gameModel = BingoGameModel(tileDataList),
        _opGameModel = BingoGameModel(_fillBot());

  static List<InGameTileDataModel> _fillBot() {
    var numberList = List.generate(25, (index) => (index + 1).toString());
    numberList.shuffle();
    numberList.shuffle();
    return List.generate(
        25,
        (index) =>
            InGameTileDataModel(index: index, tileNumber: numberList[index]));
  }

  @override
  onTilePlayed(String playedNumbebr) {
   _gameStatus = _gameModel.onTilePlayed(playedNumbebr);
    if (_gameModel.gameStatus != BingoGameStatus.inGame) {
      _gameStatus = BingoGameStatus.gameWon;
      return;
    }
    _opGameModel.onTilePlayed(playedNumbebr);
    if (_opGameModel.gameStatus != BingoGameStatus.inGame) {
      _gameStatus = BingoGameStatus.gameOver;
      return;
    }
    // play bot
    var botPlayedNumber = _opGameModel.playableTile();
    log('botplayed $botPlayedNumber');
    // validate bot reult;
    _opGameModel.onTilePlayed(botPlayedNumber);
    if (_opGameModel.gameStatus != BingoGameStatus.inGame) {
      _gameStatus = BingoGameStatus.gameOver;
      return;
    }
  _gameStatus =  _gameModel.onTilePlayed(botPlayedNumber);
    if (_gameModel.gameStatus != BingoGameStatus.inGame) {
      _gameStatus = BingoGameStatus.gameWon;

      return;
    }
  }

  @override
  getGameData() {
    return BingoGameModel.copy(_gameModel);
  }

  @override
  getGameStatus() {
    return _gameStatus;
  }

  getOpGameData(){
    return _opGameModel;
  }
}
