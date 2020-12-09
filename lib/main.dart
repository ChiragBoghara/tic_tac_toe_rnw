import 'package:flutter/material.dart';
import 'package:tic_tac_toe_rnw/select_side.dart';
import 'game_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => MainScreen(),
        '/selectSide': (context) => SelectSide(),
        '/gameScreen': (context) => GameScreen(),
      },
    );
  }
}
