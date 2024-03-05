abstract class TileDataModel {
  abstract final int index;
  abstract String _tileNumber;
  abstract TaleState taleState;
  String get tileNumber => _tileNumber;
}

class InGameTileDataModel extends TileDataModel {
  @override
  final int index;
  @override
  String _tileNumber;
  @override
  TaleState taleState;

  InGameTileDataModel({
    required this.index,
    required String tileNumber,
    this.taleState = TaleState.inActive,
  }) : _tileNumber = tileNumber;
}

enum TaleState {
  active,
  correct,
  inActive,
}

class LobbyTileDataModel extends TileDataModel {
  @override
  final int index;
  @override
  String _tileNumber;
  set tileNumber(String tileNumber) => _tileNumber =tileNumber;
  @override
  TaleState taleState;

  LobbyTileDataModel({
    required this.index,
    String tileNumber = '',
    this.taleState = TaleState.inActive,
  }) : _tileNumber = tileNumber;
}

enum LobbyTaleState {
  inActive,
  active,
  correct,
}
