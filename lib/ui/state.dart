import 'package:flutter/material.dart';

class MyShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyShowState();
  }
}

class MyShowState extends State<MyShow> {
  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Offstage(
          offstage: _offstage,
          child: FlutterLogo(size: 150),
        ),
        Text('Flutter logo is offstage:$_offstage'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _offstage = !_offstage;
              });
            },
            child: Text('Toggle Offstage Value'))
      ],
    ));
  }
}
