import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckState();
  }
}

class CheckState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool value) {
        setState(() {
          isChecked = value;
        });
      },
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyRadio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyRadioState();
  }
}

class MyRadioState extends State<MyRadio> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
                print("_character: $_character" );
              });
            },
          ),
        ),
        ListTile(
          title: Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
                print("_character: $_character" );
              });
            },
          ),
        )
      ],
    );
  }
}
