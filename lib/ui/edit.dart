import 'package:flutter/material.dart';

class MyEdit2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyEditState();
  }
}

class MyEditState extends State<MyEdit2> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextField(
      controller: _controller,
      onSubmitted: (String value) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Thinks'),
                content:
                    Text('You type $value,which has length ${value.length}'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('ok'))
                ],
              );
            });
      },
    ));
  }
}

class MyEdit extends StatelessWidget {
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('submit'),
            ),
          )
        ],
      ),
    );
  }
}
