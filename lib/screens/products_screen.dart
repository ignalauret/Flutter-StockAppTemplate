import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapptemplate/providers/products.dart';
import 'package:stockapptemplate/widgets/HomeScreenHeader.dart';
import 'package:stockapptemplate/widgets/products/products_list.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = "/products";

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Products>(context, listen: false).initStocks();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cargar Stock',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          HomeScreenHeader(
              "Productos cargados: ${productsData.loadedProductsAmount}/${productsData.productsAmount}"),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ProductsList(true),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor:
            productsData.loadedProductsAmount == productsData.productsAmount
                ? Colors.blue
                : Colors.grey,
        onPressed:
            productsData.loadedProductsAmount == productsData.productsAmount
                ? () {
                    Provider.of<Products>(context, listen: false)
                        .endProductLoading();
                    Navigator.of(context).pop();
                  }
                : null,
      ),
    );
  }
}
