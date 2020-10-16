import 'package:cheeseburger/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:cheeseburger/screens/tabs_screen.dart';
import 'package:cheeseburger/screens/institute_screen.dart';

class AllProductCarousel extends StatefulWidget {
  final List products;
  final String title;
  @override
  AllProductCarousel({Key key,@required this.title,@required this.products}): super(key:key);
  _AllProductCarousel createState() => _AllProductCarousel(title:this.title,products:this.products);
}

class _AllProductCarousel extends State<AllProductCarousel> with SingleTickerProviderStateMixin {
  double elevation=0;
  int index;
  final String title;
  final List products;
  _AllProductCarousel({Key key,@required this.title,@required this.products});
  @override
  void initState()
  {
    elevation=0;
    super.initState();
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProductScreen(product: this.products[index]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 1);
        var end = Offset.zero;
        var curve = Curves.decelerate;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  _buildProductCard(context,int index) {
    return Container(
      width: 170.0,
      child:  GestureDetector(
        onTap: () {
          setState(() {
            this.index=index;
            elevation=5.0;
          });
          int flag=0;
          var future = new Future.delayed(const Duration(milliseconds: 100));
          var subscription = future.asStream().listen((val){
            setState(() {
              elevation=0;
              flag=1;
            });
            Navigator.of(context).push(_createRoute(index));
          });
          if(flag==1){
            subscription.cancel();
          }
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (_) => ProductScreen(Product: this.products[index]),
//            ),
//          );
        },
//
        child:Container(
          child:Card(
            color: Colors.white70,
            elevation: index==this.index?this.elevation:0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Image.asset('assets/images/dummy.png',
                      height: 35,
                      width: 35,
                    ),
//                  Icon(Icons.local_hospital,
//                  size: 30,color: Colors.black54,),
                    SizedBox(width: 10,),
                    Row(
                      children: <Widget>[
                        Container (
                          width: 80,
                          child: new Column (
                            children: <Widget>[
                              Text(products[index]["name"],
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )

//                IconTheme(
//                    data: IconThemeData(
//                      color: Colors.amber,
//                      size: 20,
//                    ),
//                    child: StarDisplay(value: 3),
//                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(left: 20,right: 20),
              child: SizedBox(
                  width: double.maxFinite, // set width to maxFinite
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(title,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      RaisedButton(
                        elevation: 0,
                        child: Text("SEE ALL",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                        color: Colors.transparent,
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TabsScreen(title: title,institute: products,)
                          ),
                        );
                        },
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
        Container(
          height: 135.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(context,index);
            },
          ),
        ),
      ],
    );
  }
}
