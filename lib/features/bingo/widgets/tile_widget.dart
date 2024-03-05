import 'package:flutter/material.dart';
import 'package:num1/features/bingo/models/tile_state_model.dart';

class InGameTileWidget extends StatelessWidget {
  const InGameTileWidget({super.key, required this.data, required this.onClick});
  final TileDataModel data;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    Color bg = Colors.transparent;
    if (data.taleState == TaleState.correct) {
      bg = Colors.green;
    } else if (data.taleState == TaleState.active) {
      bg = Colors.yellow;
    }

    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(color: bg, border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              data.tileNumber.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
