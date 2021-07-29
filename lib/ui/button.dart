import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: null,
            child: const Text('Disabled'),
            style:
            TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: null,
            child: const Text('Enabled'),
            style:
            TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xff0d47a1),
                              Color(0xff1976d2),
                              Color(0xff42a5f5)
                            ],
                          )),
                    )),
                TextButton(
                  onPressed: null,
                  child: const Text("Grident"),
                  style: TextButton.styleFrom(padding: EdgeInsets.all(16),
                      primary: Colors.red,
                      textStyle:const TextStyle(fontSize: 20)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/**
 * todo 简单点击事件
 * */
class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hello world");
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

/**
 * todo 浮动按钮
 * */
class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: 'Navigation menu',
        ),
        title: const Text('Example title'),
        actions: const <Widget>[
          IconButton(
              onPressed: null, icon: Icon(Icons.search), tooltip: 'Search')
        ],
      ),
      body: const Center(
        child: Text('hello world'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}


/**
 *  todo 通用见面更新点击事件
 * */

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(onPressed: _increment, child: Text('Increment')),
        SizedBox(width: 16),
        Text('Count: $_counter')
      ],
    );
  }
}
