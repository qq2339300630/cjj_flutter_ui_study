import 'package:flutter/material.dart';

class MySimepleDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySimpleDialogState();
  }
}

class MySimpleDialogState extends State<MySimepleDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('showDialog'),
        onPressed: () {
          _showMyDialog(context);
        },
      ),
    );
  }
}

Future<void> _askedToLead(BuildContext context) async {
  switch (await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select assignment'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, Department.state),
              child: Text('State department'),
            )
          ],
        );
      })) {
    case Department.treasury:
      print('treasury');
      break;
    case Department.state:
      print('state');
      break;
  }
}

enum Department { treasury, state }

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('This is a demo alter Dialog'),
                Text('Would you liek to approve of this message')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Approve'))
          ],
        );
      });
}
