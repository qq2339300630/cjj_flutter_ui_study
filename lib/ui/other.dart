import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('Aaron Burr'),
      avatar: FilterChip(
        backgroundColor: Colors.grey.shade800,
        label: Text('kkk'),
        selected: false,
        selectedColor: Colors.red,
        onSelected: (value) {
          print(value);
        },
      ),
    );
  }
}

class Item {
  Item({this.expandedValue, this.headerValue, this.isExpanded = true});

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class MyPanelList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPaneListState();
  }
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index');
  });
}

class MyPaneListState extends State<MyPanelList> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(item.headerValue));
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panle,tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((element) => item == element);
                });
              },
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }
}

class MyBottonSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('showBottomSheet'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('BottomSheet'),
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('close BottomSheet'))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlutterLogo(size: 60),
        height: 120,
        width: 120,
        color: Colors.yellow,
        alignment: Alignment(-0.5, -0.5));
  }
}

class MyFixBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.red,
      child: FittedBox(
        child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class MyAspectRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: double.infinity,
      height: 100,
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}

class MyAspectRatio2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 200,
      height: 100,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
