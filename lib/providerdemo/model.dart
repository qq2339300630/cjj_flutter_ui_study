import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Text(
          'Value ${_counter.value}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            'Value:${counter.value}',
            style: TextStyle(fontSize: textSize.toDouble()),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
