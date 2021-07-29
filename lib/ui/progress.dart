import 'package:flutter/material.dart';

class MyProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyProgressState();
  }
}

class MyProgressState extends State<MyProgress> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Linear progress indicator with a fixed color',
            style: TextStyle(fontSize: 20),
          ),
          CircularProgressIndicator(
            strokeWidth: 10,
            value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          )
        ],
      ),
    );
  }
}
