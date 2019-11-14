import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(
        
       // height: 200,
        color: Colors.grey,
        child: Column(
          
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             /*  Expanded(
              //flex: 2,
              child: Container(
                color: Colors.orange,
                width: double.infinity,
                child: Text("sa")),
            ) ,*/ 
            //  SizedBox(height: 50,),
          //  Flexible(
            //  flex: 2,
           //   fit: FlexFit.loose,
             // child:
              Container(
                color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                // height: 300,
                width: double.infinity,
                child: Text("Imagye",textAlign: TextAlign.center,),
              ),
          //  ),
            // SizedBox(height: 30),
            // Spacer(),
            //spacer wont work since since is singlechildscrollview,by default spacer will have infinite space to grasp
            Flexible(
            //  flex: 2,
              fit: FlexFit.tight,
             child: Container(
                color: Colors.yellow,
               // padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  "abc",
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            //  SizedBox(
            //  height: 10,
            // ),
            Flexible(
            //  flex: 2,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
              //  padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  "abc",
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
