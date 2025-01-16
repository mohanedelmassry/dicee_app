import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainDice(),
    );
  }
}

class MainDice extends StatelessWidget {
  const MainDice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          "Dicee",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDice = 1;
  int rightDice = 1;
  void changeDiceFace() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            onPressed: () {
              changeDiceFace();
            },
            child: Image.asset("assets/images/dice$rightDice.jpg"),
          )),
          Expanded(
              child: TextButton(
            onPressed: () {
              changeDiceFace();
            },
            child: Image.asset("assets/images/dice$leftDice.jpg"),
          )),
        ],
      ),
    );
  }
}
