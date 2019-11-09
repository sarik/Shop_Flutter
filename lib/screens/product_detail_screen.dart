import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/cart.dart';
class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 400,
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Image.network(loadedProduct.imageUrl, fit: BoxFit.contain),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            loadedProduct.description,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          Text(
            "\$"+loadedProduct.price.toString(),
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text( cart.cartItems.containsKey(loadedProduct.id)  ? "Added to cart": "Add to cart"),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {cart.addToCart(loadedProduct.id, loadedProduct.price, loadedProduct.title);},
               color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
