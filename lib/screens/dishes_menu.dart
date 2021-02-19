import 'package:CTF_task/widgets/dishes_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

import '../widgets/main_drawer.dart';
import '../widgets/shopbadge.dart';

import '../screens/cart_screen.dart';

class DishesMenu extends StatefulWidget {
  static const routeName = '/dishes-menu';

  @override
  _DishesMenuState createState() => _DishesMenuState();
}

class _DishesMenuState extends State<DishesMenu> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalScaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red[200].withOpacity(0.5),
        elevation: 0.0,
        title: Text("Menu"),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => ShopBadge(
              child: ch,
              value: cart.totalCartItems.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: DishesList(),
    );
  }
}
