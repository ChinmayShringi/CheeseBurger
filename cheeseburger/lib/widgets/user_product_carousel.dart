import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cheeseburger/models/functions_model.dart';

class UserProductCarousel extends StatefulWidget {
  @override
  _UserProductCarousel createState() => _UserProductCarousel();
}

class _UserProductCarousel extends State<UserProductCarousel>
    with SingleTickerProviderStateMixin {
  List img=['vegetable.png', 'fruit.png','chem.png','mach.png','farmer.png'];
  int i;
  Future<String> user;
  final String title;
  final List institutes;
  List products;
  _UserProductCarousel(
      {Key key, @required this.title, @required this.institutes});

  @override
  void initState() {
    super.initState();
    user = getprod();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: user,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            this.products = jsonDecode(snapshot.data)["products"] as List;
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    backgroundColor: Colors.green,
                    pinned: true,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        "My Products",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              products[index]["type"]=='Vegetable'?i=0:
                              products[index]["type"]=='Fruit'?i=1:
                              products[index]["type"]=='Machines'?i=3:
                              products[index]["type"]=='Farmer'?i=4:
                              i=2;
                          return new GestureDetector(
                            onTap: () => {},
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Image.asset(
                                      'assets/images/${img[i]}',
                                      height: 35,
                                      width: 35,
                                    ),
                                    title: Text("${products[index]["name"]}"),
                                    subtitle: Text("3"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: products.length),
                  ),
                ],
              ),
            );
          }else{
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white, //change your color here
                    ),
                    pinned: true,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        "My Productsa",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return new GestureDetector(
                            onTap: () => {},
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("No Data"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: 1),
                  ),
                ],
              ),
            );
          }
        });
  }
}
