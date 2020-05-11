import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapptemplate/providers/products.dart';
import 'package:stockapptemplate/screens/home_screen.dart';
import 'package:stockapptemplate/screens/products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
          routes: {
            ProductsScreen.routeName: (context) => ProductsScreen(),
          },
        ),
      ),
    );
  }
}