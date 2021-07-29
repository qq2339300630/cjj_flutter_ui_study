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

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const Image(
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
        Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
      ],
    );
  }
}

class MyRow3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "dk",
        home: Scaffold(
          appBar: AppBar(
            title: Text('MyRow'),
          ),
          body: Container(
            height: 56.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(color: Colors.blue[500]),
            child: Row(
              children: <Widget>[
                IconButton(onPressed: null, icon: Icon(Icons.menu)),
                Expanded(
                    child: Title(
                        title: "oooooo",
                        child: Text(
                          '你好呀',
                          style:
                              TextStyle(color: Colors.cyanAccent, fontSize: 40),
                        ),
                        color: Colors.red)), //填充可用空间
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.search),
                  tooltip: 'Search',
                )
              ],
            ),
          ),
        ));
  }
}

class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      direction: Axis.vertical,
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('AH')),
          label: const Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('ML')),
          label: const Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('HM')),
          label: const Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('Laurens'),
        ), Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: const Text('JL')),
          label: const Text('9'),
        ),
      ],
    );
  }
}
