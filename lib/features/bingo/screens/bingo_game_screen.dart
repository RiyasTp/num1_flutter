import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:num1/features/bingo/models/bingo_game_model.dart';
import 'package:num1/features/bingo/models/tile_state_model.dart';
import 'package:num1/features/bingo/provider/bingo_game_provider.dart';
import 'package:num1/features/bingo/widgets/tile_widget.dart';
import 'package:provider/provider.dart';

class BingoGameScreen extends StatefulWidget {
  const BingoGameScreen({super.key});

  @override
  State<BingoGameScreen> createState() => _BingoGameScreenState();
}

class _BingoGameScreenState extends State<BingoGameScreen> {
  @override
  void initState() {
    context.read<BingoOfflineGameProvider>().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BingoOfflineGameProvider>();

    var lobbyTileData = provider.lobbyTiles;
    var gameData =
        provider.inGame ? provider.getGameData() : BingoGameModel([]);
         var gameDataBot =
        provider.inGame ? provider.getBotGameData() : BingoGameModel([]);
    var gameStatus = provider.inGame ? provider.getGameStatus() : null;
    return Scaffold(
        bottomNavigationBar: provider.inGame
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text('Fill'),
                      onPressed: () {
                        provider.fillTiles();
                      },
                    ),

                    ElevatedButton(
                      child: const Text('Start'),
                      onPressed: () {
                        provider.onReady();
                      },
                    ),
                  ],
                ),
              ),
        appBar: AppBar(
          title: Text(gameStatus?.name ?? 'In Lobby'),
        ),
        body: provider.inGame
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal:  18.0),
              child: TileGridView(
                  tileData: gameData.tiledataList, provider: provider),
            )
            : LobbyTileGridView(
                lobbyTileData: lobbyTileData, provider: provider));
  }
}

class LobbyTileGridView extends StatelessWidget {
  const LobbyTileGridView({
    super.key,
    required this.lobbyTileData,
    required this.provider,
  });

  final List<LobbyTileDataModel> lobbyTileData;
  final BingoOfflineGameProvider provider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: lobbyTileData.length,
      itemBuilder: (context, index) {
        var data = lobbyTileData[index];
        return GridTile(
          child: InGameTileWidget(
              data: lobbyTileData[index],
              onClick: (() {
                provider.onTileClicked(data);
              })),
        );
      },
    );
  }
}

class TileGridView extends StatelessWidget {
  const TileGridView({
    super.key,
    required this.tileData,
    required this.provider,
  });

  final List<InGameTileDataModel> tileData;
  final BingoOfflineGameProvider provider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: tileData.length,
      itemBuilder: (context, index) {
        var data = tileData[index];
        if (index == 1) {
        }
        return GridTile(
          child: InGameTileWidget(
              data: tileData[index],
              onClick: (() {
                provider.onTileClicked(data);
              })),
        );
      },
    );
  }
}

class BingoGameWrapper extends StatelessWidget {
  const BingoGameWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => BingoOfflineGameProvider()),
      child: const BingoGameScreen(),
    );
  }
}
