import 'package:flutter/material.dart';

import 'package:test_mobdev/screen/on_board_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Scaffold(body: OnBoardScreen()),
    );
  }
}
