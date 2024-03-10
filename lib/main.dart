import 'package:flutter/material.dart';
import 'package:num1/features/bingo/screens/bingo_game_screen.dart';
import 'package:num1/features/game/providers/game_provider.dart';
import 'package:num1/features/game/screens/gameplay_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp()
   
  );
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    context = context;
    return  MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0
        )
      ),
      home: const BingoGameWrapper(),
      // home: ChangeNotifierProvider(
      //   create: (_) => GameProvider(),
      //   child: GamePlayScreen()), 
    );
  }
}

