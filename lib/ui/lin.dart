import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(
            child: Text(
          'Deliver features faster',
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: Text(
          'Craft beautiful',
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: FittedBox(
          fit: BoxFit.contain,
          child: FlutterLogo(),
        )),
      ],
    );
  }
}

class MyRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text(
          'Deliver features faster',
          textAlign: TextAlign.center,
        ),
        Text(
          'Craft beautiful',
          textAlign: TextAlign.center,
        ),
        Expanded(
            child: FittedBox(
          fit: BoxFit.contain,
          child: FlutterLogo(),
        )),
      ],
    );
  }
}
