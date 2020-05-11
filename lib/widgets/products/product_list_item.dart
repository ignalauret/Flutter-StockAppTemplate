import 'package:flutter/material.dart';
import 'package:stockapptemplate/models/product.dart';

class ProductListItem extends StatelessWidget {
  ProductListItem(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              product.name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Stock: ${product.stock}",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
