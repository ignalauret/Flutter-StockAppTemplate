import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:stockapptemplate/models/product.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  Products({this.selectedBranchId});
  String selectedBranchId;
  List<Product> _products;
  Map<String, int> stocks;

  int get productsAmount {
    return _products.length;
  }

  int get loadedProductsAmount {
    return stocks.values
        .fold(0, (prev, actual) => actual == -1 ? prev : prev + 1);
  }

  Future<List<Product>> fetchProducts() async {
    if (selectedBranchId == null) return [];
    if (_products != null) return [..._products];
    _products = [];
    final response =
        await http.get("https://derrico-6cb6b.firebaseio.com/products.json");
    final products = json.decode(response.body) as List;
    for (int i = 0; i < products.length; i++) {
      _products.add(
        Product(
          id: i.toString(),
          name: products[i]["name"],
          category: categoryNames.keys.toList()[
              categoryNames.values.toList().indexOf(products[i]["category"])],
        ),
      );
    }
    final branchesResponse = await http.get("https://derrico-6cb6b.firebaseio.com/branches/$selectedBranchId.json");
    final branch = json.decode(branchesResponse.body);
    final stock = branch["stock"] as List;
    for(int i = 0; i < stock.length; i++) {
      _products[i].stock = stock[i];
    }
    return [..._products];
  }

  Future<void> updateProducts() async {
    for (Product prod in _products) {
      http.patch(
          "https://derrico-6cb6b.firebaseio.com/products/${prod.id}.json",
          body: json.encode({"stock": prod.stock}));
    }
  }

  void initStocks() {
    stocks = {};
    stocks.addEntries(_products.map((prod) => MapEntry(prod.id, -1)));
  }

  void setStock(String id, String amount) {
    final stock = amount == "" ? -1 : int.parse(amount);
    stocks.update(id, (_) => stock);
    notifyListeners();
  }

  void endProductLoading() {
    for (int i = 0; i < _products.length; i++) {
      _products[i].stock = stocks[_products[i].id];
    }
    updateProducts();
  }
}
