import 'dart:developer';

import 'package:num1/features/bingo/models/tile_state_model.dart';

class BingoGameModel {
  late List<String> _playedNumbers;

  late List<InGameTileDataModel> _tileDataList;
  List<InGameTileDataModel> get tiledataList => _tileDataList;
  late List<List<int>> _winningConditions;
  var _points = 0;
  int get points => _points;

  late BingoGameStatus _gameStatus;
  BingoGameStatus get gameStatus => _gameStatus;

  BingoGameModel(List<InGameTileDataModel> tileDataList) {
    _tileDataList = tileDataList;
    _playedNumbers = [];
    _gameStatus = BingoGameStatus.inGame;
    _winningConditions = _getWinningConditions(5);
  }
  BingoGameModel.copy(BingoGameModel original) {
    _playedNumbers = List.from(original._playedNumbers);
    _tileDataList = List.from(original._tileDataList.map((tileData) =>
        InGameTileDataModel(
            index: tileData.index,
            tileNumber: tileData.tileNumber,
            taleState: tileData.taleState)));
    _winningConditions = [];
    _points = original._points;
    _gameStatus = original._gameStatus;
  }

  onTilePlayed(String playedNumber) {
    if (_gameStatus == BingoGameStatus.inGame) {
      _playedNumbers.add(playedNumber);
      _userResultValidation(playedNumber);
    }
    return _gameStatus;
  }

  _userResultValidation(String playedNumber) {
    var tile = _tileDataList
        .firstWhere((element) => element.tileNumber == playedNumber);
    tile.taleState = TaleState.active;
    var loopCount = _winningConditions.length;

    LoopWinCond:
    for (int i = 0; i < loopCount; i++) {
      var winningCondition = _winningConditions[i];

      var states = <InGameTileDataModel>[];
      for (var condition in winningCondition) {
        var tile =
            _tileDataList.firstWhere((element) => element.index == condition);
        if (tile.taleState == TaleState.inActive) continue LoopWinCond;
        states.add(tile);
      }
      for (var state in states) {
        state.taleState = TaleState.correct;
      }
      _points++;
      i--;
      loopCount--;
      _winningConditions.remove(winningCondition);
      if (_points > 4) {
        return _gameStatus = BingoGameStatus.gameWon;
      }
    }
  }

  String playableTile() {
    var playableTiles = <InGameTileDataModel>[];

    int inAcativeCount = 10;
    for (var winningCondition in _winningConditions) {
      int count = 0;
      var tiles = <InGameTileDataModel>[];
      for (var condition in winningCondition) {
        var tile = _tileDataList[condition];
        if (tile.taleState == TaleState.inActive) {
          count++;
          tiles.add(tile);
        }
      }
      if (count == 0) continue;
      if (count < inAcativeCount) {
        inAcativeCount = count;
        playableTiles = tiles;
      }
    }

    var tile = playableTiles.first;
    return tile.tileNumber;
  }

  List<List<int>> _getWinningConditions(int count) {
    List<List<int>> conditions = [];
    int n = 0;

    for (int i = 0; i < count + count + 2; i++) {
      int ind = i;
      List<int> arr = List<int>.filled(count, 0);

      if (i < count) {
        for (int j = 0; j < arr.length; j++) {
          arr[j] = ind;
          ind += count;
        }
      }

      if (i >= count && i < count * 2) {
        for (int j = 0; j < arr.length; j++) {
          arr[j] = n;
          n++;
          if (n == count * count) {
            n = 0;
          }
        }
      }

      if (i == count * 2) {
        for (int j = 0; j < arr.length; j++) {
          arr[j] = n;
          n += count + 1;
        }
      }

      if (i == count * 2 + 1) {
        for (int j = 0; j < arr.length; j++) {
          int m = j + 1;
          int nn = count * m;
          nn = nn - m;
          arr[j] = nn;
        }
      }

      conditions.add(arr);
    }

    return conditions;
  }
}

enum BingoGameStatus {
  inGame,
  gameWon,
  gameOver,
}
