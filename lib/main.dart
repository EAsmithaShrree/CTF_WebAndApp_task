import 'package:CTF_task/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_page.dart';
import './screens/dishes_menu.dart';
import './screens/filters_page.dart';
import './screens/cart_screen.dart';
import './screens/only_veg_screen.dart';
import './screens/only_non_veg_screen.dart';

import './providers/all_meals.dart';
import './providers/cart.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AllMeals(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
        home: HomePage(),
        routes: {
          DishesMenu.routeName: (ctx) => DishesMenu(),
          FiltersPage.routeName: (ctx) => FiltersPage(),
          HomePage.routeName: (ctx) => HomePage(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OnlyVeg.routeName: (ctx) => OnlyVeg(),
          OnlyNonVeg.routeName: (ctx) => OnlyNonVeg(),
        },
      ),
    );
  }
}
