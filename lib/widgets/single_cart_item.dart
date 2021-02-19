import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class SingleCartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cart = cartProvider.items;

    return ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (ctx, index) {
          var totalprice = cart.values.toList()[index].quantity *
              cart.values.toList()[index].price;
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  color: Colors.red[200],
                  child: FittedBox(
                    child: Text(
                      "₹" + "$totalprice",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                title: Text(cart.values
                    .toList()[index]
                    .dishName), //try with longer product name

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Text("${cart.values.toList()[index].quantity} X"),
                    //SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      height: 32,
                      child: OutlineButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(Icons.remove),
                        onPressed: () {
                          cart.values.toList()[index].quantity > 1
                              ? cartProvider
                                  .undosnackbaraction(cart.keys.toList()[index])
                              : showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Are you sure?"),
                                    content: Text(
                                        "Clicking on 'Confirm' will delete this product from your cart."),
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          cartProvider.deletefromcart(
                                              cart.keys.toList()[index]);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Confirm"),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20 / 2),
                      child: Text(
                        "${cart.values.toList()[index].quantity}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 32,
                      child: OutlineButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(Icons.add),
                        onPressed: () {
                          cartProvider.addquantity(cart.keys.toList()[index]);
                        },
                      ),
                    ),

                    IconButton(
                      iconSize: 27,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        //cartProvider.deletefromcart(cart.keys.toList()[index]);
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Are you sure?"),
                            content: Text(
                                "Clicking on 'Confirm' will delete this product from your cart."),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  cartProvider.deletefromcart(
                                      cart.keys.toList()[index]);
                                  Navigator.of(context).pop();
                                },
                                child: Text("Confirm"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
