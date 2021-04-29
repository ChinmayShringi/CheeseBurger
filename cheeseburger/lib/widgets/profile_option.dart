import 'package:cheeseburger/screens/cart_screen.dart';
import 'package:cheeseburger/screens/edit_profile_screen.dart';
import 'package:cheeseburger/screens/product_reg_screen.dart';
import 'package:cheeseburger/widgets/user_product_carousel.dart';
import 'package:flutter/material.dart';

class ProfileCards extends StatefulWidget {
  final List head;
  final int nav;
  @override
  ProfileCards({Key key, @required this.head, @required this.nav})
      : super(key: key);
  _ProfileCards createState() => _ProfileCards();
}

class _ProfileCards extends State<ProfileCards>
    with SingleTickerProviderStateMixin {
  double elevation = 0;
  List head = ['SELL\nPRODUCTS', 'MY CART'];
  int index;
  @override
  void initState() {
    elevation = 0;
    super.initState();
    this.head = this.widget.head;
  }

  _buildProductCard(context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            this.index = index;
            elevation = 5.0;
          });
          int flag = 0;
          var future = new Future.delayed(const Duration(milliseconds: 100));
          var subscription = future.asStream().listen((val) {
            setState(() {
              elevation = 0;
              flag = 1;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                this.widget.nav==1?
                index == 0 ? ProductPage() : CartScreen():
                index == 0 ? UserProductCarousel() : EditPage(),

//                snapshot.data != 'Error'
//                    ? UserProductCarousel(
//                  title: 'Your Registered Product',
//                  institutes: this.institute,
//                )
//                    : Container(),
              ),
            );
          });
          if (flag == 1) {
            subscription.cancel();
          }
        },
        child: Container(
          child: Card(
            color: Colors.white70,
            elevation: index == this.index ? this.elevation : 0,
            child: Container(
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "${head[index]}",
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(context, index);
            },
          ),
        ),
      ],
    );
  }
}
