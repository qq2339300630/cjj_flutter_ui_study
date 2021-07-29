import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliderState();
  }
}

class SliderState extends State<MySlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
      max: 100,
      min: 0,
      divisions: 10,
      label: _currentSliderValue.round().toString(),
    );
  }
}

class MyTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeState();
  }
}

class TimeState extends State<MyTime> with RestorationMixin {
  final RestorableDateTime _selectedDate = RestorableDateTime(
      DateTime(2021, 7, 27));
  final RestorableRouteFuture<
      DateTime> _restorableRouteFuture = RestorableRouteFuture<DateTime>(
      onComplete: null,
      onPresent: (NavigatorState navigator, Object arguments) {
        return navigator.restorablePush(_datePickerRoute,
            arguments: 1);
      });

  void _selectDate(DateTime newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                'Selected:${_selectedDate.value.day}/${_selectedDate.value
                    .month}')));
      });
    }
  }

  static Route<DateTime> _datePickerRoute(BuildContext context,
      Object arguments) {
    return DialogRoute<DateTime>(
        context: context, builder: (BuildContext context) {
      return DatePickerDialog(
        restorationId: 'date_picker_dialog',
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: DateTime.fromMillisecondsSinceEpoch(arguments as int),
        firstDate: DateTime(2021, 1, 1),
        lastDate: DateTime(2022, 1, 1),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: () => _restorableRouteFuture.present(),
      child: Text('Open Date Picker'),);
  }

  @override
  String get restorationId => 'main';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_restorableRouteFuture, 'data_pick_route_future');
  }
}
