import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:num1/features/bingo/models/bingo_game_model.dart';
import 'package:num1/features/bingo/models/tile_state_model.dart';
import 'package:num1/features/bingo/services/bingo_game_services.dart';
import 'package:num1/features/bingo/services/bingo_offline_game_service.dart';

class BingoOfflineGameProvider extends ChangeNotifier {
  int rowCount = 5;
  late BingoOfflineGameService _gameServices;
  late List<LobbyTileDataModel> lobbyTiles;
  bool inGame = false;
  onInit() {
    lobbyTiles = List.generate(
        rowCount * rowCount, (index) => LobbyTileDataModel(index: index));
  }

  void onReady() {
    if (currentTileFillNumber != 26) {
      log('currentTileFillNumber $currentTileFillNumber');
      return;
    }
    _gameServices = BingoOfflineGameService(lobbyTiles.map((e) {
      if (e.tileNumber.isEmpty) throw 'Fill all tiles';
      return InGameTileDataModel(index: e.index, tileNumber: e.tileNumber);
    }).toList());
    inGame = true;
    notifyListeners();
  }

  BingoGameModel getGameData() {
    return _gameServices.getGameData();
  }

  BingoGameModel getBotGameData() {
    return _gameServices.getOpGameData();
  }

  BingoGameStatus getGameStatus() {
    return _gameServices.getGameStatus();
  }

  int currentTileFillNumber = 1;
  void assignNumberToTale({required int index}) {
    if (lobbyTiles[index].tileNumber.isNotEmpty) return;
    lobbyTiles[index].tileNumber = currentTileFillNumber.toString();

    currentTileFillNumber++;
  }

  void fillTiles() {
    var fillableTiles = <LobbyTileDataModel>[];
    for (var item in lobbyTiles) {
      if (item.tileNumber.isNotEmpty) continue;
      fillableTiles.add(item);
    }
    fillableTiles.shuffle();
    for (var item in fillableTiles) {
      assignNumberToTale(index: item.index);
    }
    notifyListeners();
  }

  void clearTiles(){
    for (var tiles in lobbyTiles) {
      tiles.tileNumber = '';
    }
    currentTileFillNumber =1;
    notifyListeners();
  }

  void onTilePlayed(String playedNumber) {
    _gameServices.onTilePlayed(playedNumber);
  }

  void onTileClicked(TileDataModel tile) {
    if (inGame) {
      if (tile.taleState != TaleState.inActive) return;
      onTilePlayed(tile.tileNumber);
    } else {
      assignNumberToTale(index: tile.index);
    }
    notifyListeners();
  }
}
