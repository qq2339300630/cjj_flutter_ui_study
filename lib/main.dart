// class CounterDisplay extends StatelessWidget {
//   CounterDisplay({this.count});
//
//   final int count;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('Count: $count');
//   }
// }
//
// class CounterIncrementor extends StatelessWidget {
//   CounterIncrementor({this.onPressed});
//
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: onPressed,
//       child: Text('Increment'),
//     );
//   }
// }
//
// class Counter extends StatefulWidget {
//   @override
//   _CounterState createState() => _CounterState();
// }
//
// class _CounterState extends State<Counter> {
//   int _counter = 0;
//
//   void _increment() {
//     setState(() {
//       ++_counter;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         CounterIncrementor(onPressed: _increment),
//         SizedBox(width: 16),
//         CounterDisplay(count: _counter),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

/**
 * todo 自定义 appbar
 * */
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          const IconButton(
              onPressed: null,
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu'),
          Expanded(child: title),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
              title: Text('Example title',
                  style: Theme.of(context).primaryTextTheme.headline6)),
          const Expanded(child: Center(child: Text('hello world')))
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(title: 'My app', home: SafeArea(child: MyScaffold())));
// }

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
 * todo 简单点击事件
 * */
class MyButton extends StatelessWidget {
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

class Product {
  Product({this.name});

  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({this.product, this.inCart, this.onCartChanged})
      : super(key: ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}


/**
 * todo 简单列表使用
 * */
class ShoppingList extends StatefulWidget {
  final List<Product> produces;

  ShoppingList({Key key, this.produces}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.produces.map((Product product) {
          return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged);
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      produces: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips')
      ],
    ),
  ));
}
