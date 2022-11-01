import 'package:flutter/material.dart';
import 'package:num1/features/game/providers/game_provider.dart';
import 'package:num1/features/game/widgets/game_widget_builders.dart';
import 'package:num1/features/game/widgets/number_scroll_block.dart';
import 'package:num1/features/game/widgets/result_block_widget.dart';
import 'package:provider/provider.dart';

class GamePlayScreen extends StatelessWidget {
  GamePlayScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final list = context.watch<GameProvider>().results;
    print(list.length);
    final resultWidget = List.generate(list.length, (index) {
      return ResultBlock(result: list[index]);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 0, 48),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<GameProvider>().onResetGame();
              },
              icon: const Icon(Icons.restart_alt))
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  ...resultWidget,
                  const SizedBox(height: 10,),
                  context.read<GameProvider>().isGameOver
                      ? const SizedBox()
                      : Selector<GameProvider, String>(
                          selector: (_, provider) => provider.lastInput,
                          builder: (context, inputNum, child) {
                            return GameWidgetBuilders()
                                .buildNumberBlocks(number: inputNum);
                          }),
                ]),
              ),
            ),
            const NumScrollBlock(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                child: const Text('checkNum'),
                onPressed: () {
                  context.read<GameProvider>().onPlayed();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
