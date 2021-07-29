import 'package:flutter/material.dart';

class MyText1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'txt',
      home: Text(
        'hello world',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.only(left: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyColum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ok',
        home: Scaffold(
          appBar: AppBar(
            title: Text('hello'),
          ),
          body: Column(
            children: [
              MyAppBar(
                  title: Text(
                'Example title',
                style: Theme.of(context).primaryTextTheme.headline6,
              )),
              Expanded(
                  child: Center(
                child: Text('Hello world'),
              ))
            ],
          ),
        ));
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        color: Colors.amber[600],
        width: 48,
        height: 48,
      ),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200),
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue[600],
      alignment: Alignment.center,
      child: Text(
        'Hello World',
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
      ),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}

class MyBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 20.0, color: Colors.red),
            left: BorderSide(width: 1.0, color: Color(0xffffffff)),
            right: BorderSide(width: 1.0, color: Color(0xff000000)),
            bottom: BorderSide(width: 1.0, color: Color(0xff000000)),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xffdfdfdf)),
              left: BorderSide(width: 1.0, color: Color(0xffdfdfdf)),
              right: BorderSide(width: 1.0, color: Color(0xff7f7f7f)),
              bottom: BorderSide(
                width: 10.0,
                color: Colors.green,
              ),
            ),
          ),
          child: const Text(
            'OK',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF000000)),
          ),
        ));
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello,How are you',
      textAlign: TextAlign.right,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class MyText2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(text: 'Hello', children: <TextSpan>[
      TextSpan(
          text: 'beautiful', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ]));
  }
}

class MyEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}

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
