import 'package:flutter/material.dart';
import 'package:num1/features/game/providers/game_provider.dart';
import 'package:num1/features/game/widgets/number_scroll_wheel.dart';
import 'package:provider/provider.dart';

class NumScrollBlock extends StatelessWidget {
  const NumScrollBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final update = context.watch<GameProvider>().updateOnScroll;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberScrollWheel(update: update, pos: 0),
        const SizedBox(width: 5),
        NumberScrollWheel(update: update, pos: 1),
        const SizedBox(width: 5),
        NumberScrollWheel(update: update, pos: 2),
      ],
    );
  }
}
