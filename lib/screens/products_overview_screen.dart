import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Column(
        children: <Widget>[
          ProductsGrid(),
          Consumer<Cart>(
            builder: (ctx, data, child) => FloatingActionButton(
              child: Text(data.len().toString()),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
