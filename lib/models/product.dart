import 'package:flutter/foundation.dart';
class Product{

  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final bool isFav;
  final double price;


  Product({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.description,
    this.isFav = false});
}