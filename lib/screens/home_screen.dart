import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapptemplate/providers/branches.dart';
import 'package:stockapptemplate/screens/products_screen.dart';
import 'package:stockapptemplate/utils/constants.dart';
import 'package:stockapptemplate/widgets/HomeScreenHeader.dart';
import 'package:stockapptemplate/widgets/products/products_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final branchesData = Provider.of<Branches>(context, listen: false);
    branchesData.fetchBranches().then(
          (branches) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: MAIN_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text(
                "Seleccione una sucursal",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              content: Container(
                color: Colors.transparent,
                height: 200,
                width: 100,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          branchesData.selectBranch(branches[index].id);
                          Navigator.of(context).pop();
                        },
                          child: Text(
                        branches[index].name,
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                  itemCount: branches.length,
                ),
              ),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final branchesData = Provider.of<Branches>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Stock',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              branchesData.selectBranch("0");
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          HomeScreenHeader("Sucursal: ${branchesData.branch}"),
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
                    child: ProductsList(false),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.store),
        onPressed: () {
          Navigator.pushNamed(context, ProductsScreen.routeName);
        },
      ),
    );
  }
}
