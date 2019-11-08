import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;

  CartProductItem(this.name, this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex:7,
            child: Card(
              // margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  // leading: ,
                  title: Text(name),
                  subtitle: Text(name + " thanks for the purchase"),
                  trailing: Chip(
                    label: Text("${quantity.toString()}"),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            //flex: 1,
            fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: CircleAvatar(
                //padding: EdgeInsets.all(4),
                child: Padding(
                    padding: EdgeInsets.all(4),
                    child: FittedBox(child: Text("\$ $price"))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
