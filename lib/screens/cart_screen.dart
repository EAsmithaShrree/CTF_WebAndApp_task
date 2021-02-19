import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

import '../widgets/single_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text("Your Cart"),
      ),
      bottomNavigationBar: Card(
        elevation: 0,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(width: 10),
              Spacer(),
              Chip(
                label: Text(
                  "₹" + '${cart.totalCartPrice}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.5,
                  ),
                ),
                backgroundColor: Colors.brown, // to be changed later
              ),
              SizedBox(width: 15),
              FlatButton(
                color: Colors.red[200],
                onPressed: () {},
                child: Text(
                  "BUY NOW",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: SingleCartItem(),
          ),
        ],
      ),
    );
  }
}
