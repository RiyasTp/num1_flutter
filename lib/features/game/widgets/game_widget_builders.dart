import 'package:flutter/material.dart';
import 'package:num1/features/game/widgets/played_number_widget.dart';

class GameWidgetBuilders {
   static final GameWidgetBuilders _instance = GameWidgetBuilders._internal();

  factory GameWidgetBuilders() => _instance;

  GameWidgetBuilders._internal();

  Widget buildNumberBlocks({int length = 3, required String number}) {
   final children = List.generate(
      length,
      (index) => PlayedNumberWidget(
        number: number[index], 
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, children:children
    );
  }
}
