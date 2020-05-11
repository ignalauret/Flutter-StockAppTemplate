import 'package:flutter/material.dart';
import 'package:stockapptemplate/models/product.dart';
import 'package:stockapptemplate/widgets/products/product_list_input_item.dart';
import 'package:stockapptemplate/widgets/products/product_list_item.dart';

class ProductCategoryCard extends StatelessWidget {
  ProductCategoryCard(this.category, this.products, this.isInput);
  final ProductCategory category;
  final List<Product> products;
  final bool isInput;


  List<Widget> _buildItemCard(List<Product> products) {
    if (isInput) {
      return products.map((product) => ProductListInputItem(product)).toList();
    } else {
      return products.map((product) => ProductListItem(product)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return products.length == 0
        ? Container()
        : Card(
            color: Colors.transparent,
            margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        categoryIcons[category],
                        size: 25,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        categoryNames[category],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ..._buildItemCard(products),
                ],
              ),
            ),
          );
  }
}
