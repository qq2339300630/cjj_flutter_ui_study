import 'package:cjj_flutter_ui_study/models/cart.dart';
import 'package:cjj_flutter_ui_study/models/cartlog.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyCatelog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return _MyListItem(index);
          }))
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>((cart) {
      return cart.items.contains(item);
    });

    return TextButton(
        onPressed: isInCart
            ? null
            : () {
                var cart = context.read<CartModel>();
                cart.add(item);
              },
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          } else {
            return null;
          }
        })),
        child: isInCart
            ? const Icon(
                Icons.check,
                semanticLabel: 'ADDED',
              )
            : const Text('ADD'));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>((catelog) {
      return catelog.getByPosition(index);
    });
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
                child: Text(
              item.name,
              style: textTheme,
            )),
            const SizedBox(
              width: 24,
            ),
            _AddButton(
              item: item,
            )
          ],
        ),
      ),
    );
  }
}
