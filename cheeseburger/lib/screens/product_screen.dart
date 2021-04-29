import 'dart:convert';
import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/cart_screen.dart';
import 'package:cheeseburger/services/firebase.services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductScreen extends StatefulWidget {
  final product;
  @override
  ProductScreen({Key key, @required this.product}) : super(key: key);
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<String> map = [
    'assets/images/c3.jpg',
    'assets/images/c1.jpg',
    'assets/images/c2.jpg'
  ];
  var data;

  @override
  void initState() {
    super.initState();
    print(this.widget.product.id);
    // prodUser = getUser(jsonDecode(this.widget.product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                child: FlatButton(
                  child: Text('ADD TO CART'),
//                  color: Colors.b,
                  textColor: Colors.black,
                  onPressed: () {
                    FirestoreService().addCart(this.widget.product);
                    // addToCart(this.product["name"],this.product["price"],this.product["id"],this.product["type"]);
                  },
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                child: FlatButton(
                  child: Text('BUY NOW'),
                  textColor: Colors.black,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (_) =>
                    //       CartScreen(product:this.product)),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: ListView(children: <Widget>[
          Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.asset(
                        map[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 1,
//                  control: new SwiperControl(color: Colors.white),
                    autoplay: false,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(this.widget.product['name'],
                        style: TextStyle(color: Colors.black54, fontSize: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 5, bottom: 10),
                      child: Container(
                        color: Color.fromRGBO(6, 142, 60, 1),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "4.6",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 5, bottom: 10),
                        child: Text("2,692")),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        '${this.widget.product['price']}',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Description",
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.2,
                        child: Text(
                          'This is some description about the product',
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 20, top: 20),
                      child: Text(
                        "Posted by",
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
        StreamBuilder(
        stream:Firestore.instance.collection('users').doc('${this.widget.product['uid']}').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print(snapshot);
      if (!snapshot.hasData) return new Text('Loading...');
      return Table(columnWidths: {
        1: FractionColumnWidth(.68)
      }, children: <TableRow>[
        TableRow(children: <Widget>[
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 20.0),
              child: Text("Name:"),
            ),
          ),
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Text(
              snapshot.data['displayName'],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]),
        TableRow(children: <Widget>[
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 20.0),
              child: Text("Email:"),
            ),
          ),
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Text(
              snapshot.data['email'],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]),
        TableRow(children: <Widget>[
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 20.0),
              child: Text("Contact No:"),
            ),
          ),
          TableCell(
            verticalAlignment:
            TableCellVerticalAlignment.middle,
            child: Text(
              '8469227345',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]
        ),
      ]
      );
    }
        )
              ]
          )
        ]
        )
    );
  }
}
