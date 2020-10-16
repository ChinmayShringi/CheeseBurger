import 'dart:convert';
import 'package:cheeseburger/models/functions_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List img = [
    'vegetable.png',
    'fruit.png',
    'chem.png',
    'mach.png',
    'farmer.png'
  ];
  int totalAmount = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//            Container(
//              child: Text(
//                'Total: \$${totalAmount}',
//                style: TextStyle(fontSize: 18),
//              ),
//            ),
            Container(
              child: FlatButton(
                color: Colors.red,
                child: Text('Pay Now'),
//                  color: Colors.deepOrange,
                textColor: Colors.white,
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (_) => CartScreen()),
//                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(shrinkWrap: true, children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
          Container(
            height: 250.0,
            width: double.infinity,
            color: Color(0xFFFDD148),
          ),
          Positioned(
            bottom: 510.0,
            right: 100.0,
            child: Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Color(0xFFFEE16D),
              ),
            ),
          ),
          Positioned(
            bottom: 500.0,
            left: 150.0,
            child: Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    color: Color(0xFFFEE16D).withOpacity(0.5))),
          ),
          Positioned(
              top: 75.0,
              left: 15.0,
              child: Text(
                'Shopping Cart',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: StreamBuilder(
                  stream: Firestore.instance.collection('basket').where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: EdgeInsets.only(left: 40, top: 50),
                        child: Text(
                          "Fetching Your Cart...",
                          style: TextStyle(color: Colors.black54, fontSize: 28),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          // totalAmount += (jsonDecode(snapshot.data)["Cart"]
                          //         [index]["price"] *
                          //     jsonDecode(snapshot.data)["Cart"][index]
                          //         ["quantity"]);
                          return Container(
                              height: 120,
                              child: itemCard(
                                  // snapshot.data[index]['name'],
                                snapshot.data.documents[0]['name'],
                                  'gray',
                                  snapshot.data.documents[0]['price'],
                                  'assets/images/vegetable.png',
                                  true,
                                  0,
                                snapshot.data.documents[0]['quantity'],
                                  'gray',
                              )
                          );
                        },
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(left: 40, top: 50),
                        child: Text(
                          "No Items In your Cart!",
                          style: TextStyle(color: Colors.black54, fontSize: 28),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ])
      ]),
    );
  }

  Widget itemCard(itemName, color, price, imgPath, available, i, quantity,id) {
    return InkWell(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 0.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(width: 7.0),
                              Text(
                                'x' + quantity,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(height: 14.0),
                          Text(
                            '\$' + price,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0xFFFDD34A)),
                          )
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/4,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: ()=>{
                                  removeFromCart(id).then((val)=>{
                                    print("asd"),
                                    // setGood()
                                  })
                                },
                              child:Icon(
                                Icons.delete,
                               color: Colors.red,
                              )
                              )
                            ],
                          ),

                        ],
                      )
                    ],
                  )))),
    );
  }
}
