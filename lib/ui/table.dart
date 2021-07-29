import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
            label: Text('Name', style: TextStyle(fontStyle: FontStyle.italic))),
        DataColumn(
            label: Text(
              'Age',
              style: TextStyle(fontStyle: FontStyle.italic),
            )),
        DataColumn(
            label: Text(
              'Role',
              style: TextStyle(fontStyle: FontStyle.italic),
            ))
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Sarah')),
          DataCell(Text('19')),
          DataCell(Text('Student'))
        ]),
        DataRow(cells: [
          DataCell(Text('Janine')),
          DataCell(Text('43')),
          DataCell(Text('Professor'))
        ]),
        DataRow(cells: [
          DataCell(Text('William')),
          DataCell(Text('27')),
          DataCell(Text('Associate Professor'))
        ])
      ],
    );
  }
}


class MyTable2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTableState();
  }

}

class MyTableState extends State<MyTable2> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: DataTable(columns: [
      DataColumn(label: Text('Number'))
    ],
        rows: List<DataRow>.generate(numItems, (int index) =>
            DataRow(
                color: MaterialStateProperty.resolveWith((
                    Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))
                    return Theme
                        .of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  if (index.isEven) {
                    return Colors.grey.withOpacity(0.3);
                  }
                  return null;
                }), cells: <DataCell>[
              DataCell(Text('Row $index'))
            ], selected: selected[index], onSelectChanged: (value) {
              setState(() {
                selected[index] = value;
              });
            })
        )
    )
    );
  }

}