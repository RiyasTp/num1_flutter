import 'package:flutter/material.dart';
import 'package:num1/features/game/providers/game_provider.dart';
import 'package:num1/features/game/screens/gameplay_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context = context;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePlayScreen(), 
    );
  }
}

