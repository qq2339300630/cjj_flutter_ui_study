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

import 'package:cjj_flutter_ui_study/common/theme.dart';
import 'package:cjj_flutter_ui_study/providerdemo/model.dart';
import 'package:cjj_flutter_ui_study/screens/cart.dart';
import 'package:cjj_flutter_ui_study/screens/catalog.dart';
import 'package:cjj_flutter_ui_study/screens/login.dart';
import 'package:cjj_flutter_ui_study/ui/txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'models/cartlog.dart';

import 'package:flutter/rendering.dart';

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
    return Container(
        height: 100.0,
        child: ListTile(
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
        ));

    // return ListTile(
    //   onTap: () {
    //     onCartChanged(product, inCart);
    //   },
    //   leading: CircleAvatar(
    //     backgroundColor: _getColor(context),
    //     child: Text(product.name[0]),
    //   ),
    //   title: Text(
    //     product.name,
    //     style: _getTextStyle(context),
    //   ),
    // );
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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 12 / 1,
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

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grad List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: new List.generate(100, (index) {
            return new Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline1,
            );
          }),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     title: 'Shopping App',
//     home: ShoppingList(
//       produces: <Product>[
//         Product(name: 'Eggs'),
//         Product(name: 'Flour'),
//         Product(name: 'Chocolate chips'),
//         Product(name: 'tomato'),
//         Product(name: 'banana'),
//         Product(name: 'Apple'),
//       ],
//     ),
//   ));
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) {
          return CatalogModel();
        }),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) {
            return CartModel();
          },
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catelog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) {
            return MyLogin();
          },
          '/catalog': (context) {
            return MyCatelog();
          },
          '/cart': (context) {
            return MyCart();
          }
        },
      ),
    );
  }
}

// void main() {
//   final counter = CounterModel();
//   final textSize = 48;
//
//   runApp(Provider<int>.value(
//     value: textSize,
//     child: ChangeNotifierProvider.value(
//       value: counter,
//       child: ProviderDemo1(),
//     ),
//   ));
// }

void main() {
  debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    title: 'ok',
    home: Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        body: MyBorder()),
  ));
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
