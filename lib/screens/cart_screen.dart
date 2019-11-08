import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;

//import '../widgets/cart_product_item.dart' as cpi;
import '../widgets/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart", style: TextStyle(fontSize: 22))),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.only(right: 1, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      " ${cart.getTotal.floorToDouble().toString()}",
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("BUY NOW"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, item) {
                var curr = cart.cartItems.values.toList()[item];
                return CartProductItem(
                  curr.name,
                  curr.quantity,
                  curr.price,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
