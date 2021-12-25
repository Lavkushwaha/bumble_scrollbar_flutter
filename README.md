[![Pub](https://img.shields.io/pub/v/bumble_scrollbar.svg)](https://pub.dev/packages/bumble_scrollbar)



## Bumble Like Scrollbar

![The example app running in iOS](https://github.com/Lavkushwaha/bumble_scrollbar_flutter/blob/master/bumble_scrollbar.gif?raw=true)


```dart


  BumbleScrollbar(
    child: Container(
            color: Colors.grey,
            child: Column(
                    children: List.generate(
                    30,
                    (index) => Container(
                            color: Colors.grey,
                            //color: getRandomColor(),
                            height: 500,
                          ),
                          ),
                        ),
                    ),
                );
      



   BumbleScrollbar({
    required this.child,
    this.strokeWidth = 6,
    this.strokeHeight = 100,
    this.backgroundColor = Colors.black12,
    this.thumbColor = Colors.white,
    this.alignment = Alignment.topRight,
    this.padding = EdgeInsets.zero,
    this.strokeConnerType = StrokeConnerType.rounded,
    this.showScrollbar = true,
    this.scrollbarMargin = const EdgeInsets.all(8.0),
  });




```




Here is an example of logging a debug message and an error:

```dart
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
```


