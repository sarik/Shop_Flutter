import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  ProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments:title);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            title: Text(title),
            trailing: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          )),
    );
  }
}
