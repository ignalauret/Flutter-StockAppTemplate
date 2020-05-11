import 'package:flutter/material.dart';

enum ProductCategory { Food, Drink, Utility }

Map<ProductCategory, String> categoryNames = {
  ProductCategory.Food: "Comida",
  ProductCategory.Drink: "Bebida",
  ProductCategory.Utility: "Utilidades",
};

Map<ProductCategory, IconData> categoryIcons = {
  ProductCategory.Food: Icons.fastfood,
  ProductCategory.Drink: Icons.local_drink,
  ProductCategory.Utility: Icons.edit,
};

Map<ProductCategory, Color> categoryColors = {
  ProductCategory.Food: Colors.red,
  ProductCategory.Drink: Colors.lightBlue,
  ProductCategory.Utility: Colors.brown,
};

class Product {
  Product({
    @required this.id,
    @required this.name,
    @required this.category,
    this.stock = 0,
  });

  final String id;
  final String name;
  final ProductCategory category;
  int stock;
}
