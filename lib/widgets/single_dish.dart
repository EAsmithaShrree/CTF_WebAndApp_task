import 'package:CTF_task/providers/cart.dart';
import 'package:CTF_task/providers/meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleDish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    var singleDish = Provider.of<Meal>(context, listen: false);
    return Container(
      height: 200,
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: singleDish.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          singleDish.mealName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Spacer(),
                        Consumer<Meal>(
                          builder: (ctx, dish, child) => IconButton(
                            icon: Icon(dish.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined),
                            onPressed: () {
                              print("old status: ${dish.isFavourite}");
                              dish.toggleFavouriteStatus();
                              print("new status: ${dish.isFavourite}");
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(singleDish.description),
                    SizedBox(height: 5.5),
                    //Spacer(),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            "₹" + singleDish.price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.5,
                            ),
                          ),
                          backgroundColor: Colors.red[200],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.shopping_cart_outlined),
                          iconSize: 35,
                          onPressed: () {
                            cart.addToCart(singleDish.mealId,
                                singleDish.mealName, singleDish.price);
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                //backgroundColor: Colors.black,
                                content: Text("Item added to cart."),

                                action: SnackBarAction(
                                  label: "UNDO",
                                  textColor: Colors.red[200],
                                  onPressed: () {
                                    cart.undosnackbaraction(singleDish.mealId);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
