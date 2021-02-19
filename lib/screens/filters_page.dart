import 'package:CTF_task/providers/cart.dart';

import 'package:CTF_task/widgets/favourite_dishes_list.dart';
import 'package:CTF_task/widgets/shopbadge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import 'cart_screen.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200].withOpacity(0.5),
        elevation: 0.0,
        title: Text("Your Favourites"),
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
      body: FavouriteDishesList(),
    );
  }
}
