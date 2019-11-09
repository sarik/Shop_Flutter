import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartProductItem extends StatelessWidget {
  final String name;
  final String productId;
  final double price;
  final int quantity;

  CartProductItem(this.name, this.productId, this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(productId),
      onDismissed: (direction) => cart.removeItem(productId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            flex: 6,
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
            fit: FlexFit.loose,
            flex: 4,
            child: Container(
              //width: 200,
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: Row(children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  flex:1,
                  child: SizedBox(
                    width: 90,
                    child: FlatButton(
                     // color: Theme.of(context).accentColor,
                      child: Container(
                        alignment: Alignment.center,
                          /* decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(10),
                          ), */
                          child: Container(alignment: Alignment.center, child: Icon(Icons.add))),
                      onPressed: () {cart.changeQuantity(productId, "add");},
                    ),
                  ),
                ),
                Flexible(
                  flex:1,
                  fit: FlexFit.loose,
                  child: SizedBox(
                    width: 80,
                    child: Chip(
                      label: Text("${quantity.toString()}"),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex:1,
                  child: SizedBox(
                    width: 90,
                    child: FlatButton(
                     // color: Theme.of(context).accentColor,
                      child: Container(
                        alignment: Alignment.center,
                          /* decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(10),
                          ), */
                          child: Container(alignment: Alignment.center, child: Icon(Icons.remove))),
                      onPressed: () {cart.changeQuantity(productId, "remove");},
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
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
