import 'package:flutter/material.dart';
import 'package:num1/ui/screens/reslut_screen.dart';
import '../../logic.dart';
import '../widgets/num_scroll.dart';
import '../widgets/scorll_wheel_number.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Game newGame = Game();
  ValueNotifier<List<String>> playedNumbers =
      ValueNotifier(['000', '000', '000', '000', '000', '000', '']);
  ValueNotifier<List<Widget>> validations = ValueNotifier([
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ]);
  ValueNotifier<String> newNumber = ValueNotifier('000');

  void newInputNum(String newInputNum) {
    playedNumbers.value[Game.tries] = newInputNum;
    newNumber.value = newInputNum;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 0, 48),
      body: Column(
        children: [
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: newNumber,
            builder: (BuildContext context, String value, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: Game.tries + 1,
                itemBuilder: (BuildContext context, int index) {
                  return NumberBlocks(
                    newNumber: playedNumbers.value[index],
                    isActive: Game.tries == index ? true : false,
                    validations: validations.value[index],
                  );
                },
              );
            },
          )),
          NumScroll(
            newNumber: newInputNum,
          ),
          ElevatedButton(
            onPressed: () {
              if (Game.inGame) {
                Widget positons =
                    newGame.checkWin(playedNumbers.value[Game.tries]);
                newNumber.value = playedNumbers.value[Game.tries - 1];
                // print(positons);
                validations.value[Game.tries - 1] = positons;
                newNumber.notifyListeners();
              }
              playedNumbers.value[Game.tries] =
                  playedNumbers.value[Game.tries - 1];
              if (!Game.inGame) {
                playedNumbers.value[Game.tries] = '000';

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultScreen(
                        playedNumbers: playedNumbers.value,
                        positons: validations.value),
                  ),
                );
              }
              print(playedNumbers.value);
            },
            child: const Text('Check'),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class NumberBlocks extends StatelessWidget {
  String newNumber;
  bool isActive;
  Widget validations;

  NumberBlocks(
      {Key? key,
      required this.newNumber,
      required this.isActive,
      required this.validations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fontColor = isActive ? Colors.amber : Colors.red;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ScrolWheelNumber(
            number: newNumber[0],
            selectedColor: fontColor,
            fontSize: 40,
          ),
          const SizedBox(width: 10),
          ScrolWheelNumber(
            number: newNumber[1],
            selectedColor: fontColor,
            fontSize: 40,
          ),
          const SizedBox(width: 10),
          ScrolWheelNumber(
            number: newNumber[2],
            selectedColor: fontColor,
            fontSize: 40,
          ),
        ]),
        validations,
      ]),
    );
  }
}
