import 'package:flutter/material.dart';

class HomeWish extends StatefulWidget {
  @override
 _HomeWishPageState createState() => new _HomeWishPageState();
}

class _HomeWishPageState extends State<HomeWish> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'WishList',
         ),
        ),
        body: Container(
    child:Padding(
    padding: EdgeInsets.all(10),
      child:new SingleChildScrollView(
      scrollDirection: Axis.vertical,
            child:
                new Column(
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Image.asset(
                      'assets/images/farm.png',
                      height: 130,
                      width: 130,
                    ),
                    Center(
                      child: Text("Want to save something for later?.",style: TextStyle(
                      fontSize: 18,
                    ),),
                    ),
                    Center(
                      child: Text("Your wishlist will go here",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54
                      ),),
                    ),
                    SizedBox(height: 100,),
                    Align(
                     alignment: Alignment.topLeft,
                     child: Text("Browse help topics:",style: TextStyle(
                     fontSize: 20,
                      ),),
                    ),
                   new ListTile(
                    leading: Icon(Icons.people_outline),
                    title: new Text('Browse by Sellers'),
                   ),
                   new ListTile(
                     leading: Icon(Icons.location_on),
                     title: new Text('Browse by Location'),
                    ),
                    new ListTile(
                     leading: Icon(Icons.star_half),
                     title: new Text('Browse by Reviews'),
                    ),
                   new ListTile(
                     leading: Icon(Icons.compare_arrows),
                     title: new Text('Browse by Ranking'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.receipt),
                      title: new Text('Browse by Records'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.sort_by_alpha),
                      title: new Text('Browse by Name'),
                    ),
                  ],
          ),
        ),
    ),
        ),
    );
  }

}
