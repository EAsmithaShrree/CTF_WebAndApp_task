import 'package:flutter/material.dart';

class Meal with ChangeNotifier {
  final String mealId;
  final double price;
  final String description;
  final String mealName;
  bool isFavourite;
  final bool isVeg;

  final AssetImage image;

  Meal({
    @required this.mealId,
    @required this.price,
    @required this.mealName,
    @required this.description,
    this.isFavourite = false,
    @required this.isVeg,
    @required this.image,
  });

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
