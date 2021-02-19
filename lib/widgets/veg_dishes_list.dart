import 'package:CTF_task/widgets/single_dish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_meals.dart';

class VegDishesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allDishes = Provider.of<AllMeals>(context);
    final favDishes = allDishes.vegDishes;

    return ListView.builder(
      itemCount: favDishes.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: favDishes[i],
        child: SingleDish(),
      ),
    );
  }
}
