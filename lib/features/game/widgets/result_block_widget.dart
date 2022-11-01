import 'package:flutter/material.dart';
import 'package:num1/features/game/models/result_model.dart';
import 'package:num1/features/game/widgets/game_result_validation_widget.dart';
import 'package:num1/features/game/widgets/game_widget_builders.dart';
import 'package:num1/features/game/widgets/scroll_wheel_number_widget.dart';

class ResultBlock extends StatelessWidget {
  final Result result;
  const ResultBlock({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = result.playedNumber;
    final wrongCount = result.wrongPlace;
    final correctCount = result.correctPlace;
    return Padding(
      padding: const EdgeInsets.only(top:10.0), 
      child: Column(children: [
        GameWidgetBuilders().buildNumberBlocks(number: number),
        (result.number != null)
            ? Text(
                'You ${result.status}!! Number is ${result.number}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: result.status == 'won'
                        ? const Color.fromARGB(255, 0, 158, 34)
                        : Colors.red),
              )
            : ResultValidatonWidget(
                correctPlace: correctCount,
                wrongPlace: wrongCount,
              ),
      ]),
    );
  }
}
