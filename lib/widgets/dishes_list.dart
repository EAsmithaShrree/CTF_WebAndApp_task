import 'package:CTF_task/widgets/single_dish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_meals.dart';

class DishesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allDishes = Provider.of<AllMeals>(context);
    final products = allDishes.items;

    return ListView.builder(
      //padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: SingleDish(),
      ),
    );
  }
}
