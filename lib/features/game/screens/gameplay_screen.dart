import 'package:flutter/material.dart';
import 'package:num1/features/game/providers/game_provider.dart';
import 'package:provider/provider.dart';


class GamePlayScreen extends StatelessWidget {
   GamePlayScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity, 
        child: Center(child: Column(
          children: [
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(child: const  Text('checkNum'), onPressed: () {
              print('pressed');
              context.read<GameProvider>().onPlayed(controller.text);
            },),
          ],
        )),
      ),
    );
  }
}