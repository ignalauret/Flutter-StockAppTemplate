import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapptemplate/models/product.dart';
import 'package:stockapptemplate/providers/products.dart';
import 'package:stockapptemplate/widgets/products/product_category_card.dart';

class ProductsList extends StatelessWidget {
  ProductsList(this.isInput);
  final bool isInput;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return FutureBuilder<List<Product>>(
      future: productsData.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.data.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (ctx, index) => ProductCategoryCard(
                ProductCategory.values[index],
                snapshot.data
                    .where((prod) =>
                        prod.category == ProductCategory.values[index])
                    .toList(),
                isInput,
              ),
              itemCount: ProductCategory.values.length,
            );
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
