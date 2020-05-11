import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:stockapptemplate/models/product.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  List<Product> _products;
  Map<String, int> stocks;

  int get productsAmount {
    return _products.length;
  }

  int get loadedProductsAmount {
    return stocks.values.fold(0, (prev, actual) => actual == -1 ? prev : prev + 1);
  }

  Future<List<Product>> fetchProducts() async {
    if (_products != null) return [..._products];
    _products = [];
    final response =
        await http.get("https://derrico-6cb6b.firebaseio.com/products.json");
    final products = json.decode(response.body) as List;
    for (int i = 0; i < products.length; i++) {
      _products.add(Product(
        id: i.toString(),
        name: products[i]["name"],
        stock: products[i]["stock"],
        category: categoryNames.keys.toList()[
            categoryNames.values.toList().indexOf(products[i]["category"])],
      ));
    }
    return [..._products];
  }

  void initStocks() {
    stocks = {};
    stocks.addEntries(_products.map((prod) => MapEntry(prod.id, -1)));
  }

  void setStock(String id, int amount) {
    stocks.update(id, (_) => amount);
    notifyListeners();
  }

  void endProductLoading() {
    print(stocks);
  }

}
