import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Hallo ini adalah halaman home',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
