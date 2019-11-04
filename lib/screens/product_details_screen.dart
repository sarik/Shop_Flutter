import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {

  static const routeName = "/product-details";
  @override
  Widget build(BuildContext context) {
    final String routeArgs =
          ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(routeArgs),),
    );
  }
}