import 'dart:math';

import 'package:bumble_scrollbar/bumble_scrollbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Color getRandomColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bumble Like Scrollbar'),
        ),
        body: BumbleScrollbar(
          child: Container(
              color: Colors.grey,
              child: Column(
                  children: List.generate(
                      30,
                      (index) => Container(
                            color: getRandomColor(),
                            height: 500,
                          )))),
        ),
      ),
    );
  }
}
