import 'package:num1/features/bingo/models/bingo_game_model.dart';

abstract class BingoGameServices {
  onTilePlayed(String playedNumbebr);
 BingoGameModel getGameData();
 BingoGameStatus getGameStatus();
}