import 'package:flutter/material.dart';

import './meal.dart';

class AllMeals with ChangeNotifier {
  List<Meal> _items = [
    Meal(
      description:
          "A short description of the dish shall be added here.It is just an idea of what the dish will be like.",
      mealId: '1',
      price: 120,
      image: AssetImage('assets/images/Poha Idly.jpg'),
      mealName: 'Poha Idly',
      isVeg: true,
    ),
    Meal(
      description:
          "A short description of the dish shall be added here.It is just an idea of what the dish will be like.",
      mealId: '2',
      price: 110,
      image: AssetImage('assets/images/Masala Dosai.jpg'),
      mealName: 'Masala Dosai',
      isVeg: true,
    ),
    Meal(
      description:
          "A short description of the dish shall be added here.It is just an idea of what the dish will be like.",
      mealId: '3',
      price: 150,
      image: AssetImage('assets/images/Medu Vada.jpg'),
      mealName: 'Medu Vada',
      isVeg: true,
    ),
    Meal(
      description:
          "A short description of the dish shall be added here.It is just an idea of what the dish will be like.",
      mealId: '4',
      price: 90,
      image: AssetImage('assets/images/Non Veg Meals.jpg'),
      mealName: 'Non Veg Meal',
      isVeg: false,
    ),
    Meal(
      description:
          "A short description of the dish shall be added here.It is just an idea of what the dish will be like.",
      mealId: '5',
      price: 220,
      image: AssetImage('assets/images/Chicken Fry.jpg'),
      mealName: 'Chicken Fry',
      isVeg: false,
    ),
    Meal(
      description:
          "A short description of the dish shall be added here. It is an idea of what the dish will be like.",
      mealId: '6',
      price: 520,
      image: AssetImage('assets/images/Veg Meals.jpg'),
      mealName: 'Veg Meals',
      isVeg: true,
    ),
  ];

  List<Meal> get items {
    return [..._items];
  }

  List<Meal> get favouriteDishes {
    return _items.where((element) => element.isFavourite == true).toList();
  }

  List<Meal> get vegDishes {
    return _items.where((element) => element.isVeg == true).toList();
  }

  List<Meal> get nonVegDishes {
    return _items.where((element) => element.isVeg == false).toList();
  }
}
