import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stockapptemplate/models/product.dart';
import 'package:stockapptemplate/providers/products.dart';

class ProductListInputItem extends StatelessWidget {
  ProductListInputItem(this.product);

  final Product product;

  void setStock(BuildContext context, int amount) {
    Provider.of<Products>(context, listen: false).setStock(product.id, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        height: 40,
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
            Container(
              width: 120,
              padding: const EdgeInsets.only(top: 13),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nuevo stock",
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onChanged: (s) => setStock(context, int.parse(s)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
