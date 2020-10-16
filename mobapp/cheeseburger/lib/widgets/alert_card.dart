import 'package:flutter/material.dart';

class AlertCard extends StatefulWidget {
  @override
  _AlertCard createState() => _AlertCard();
}

class _AlertCard extends State<AlertCard> with SingleTickerProviderStateMixin {
  double elevation = 0;
  int index;
  @override
  void initState() {
    elevation = 0;
    super.initState();
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
//      pageBuilder: (context, animation, secondaryAnimation) => InstituteScreen(institute: this.institutes[index]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 1);
        var end = Offset.zero;
        var curve = Curves.decelerate;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  _buildProductCard(context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:
      GestureDetector(
//              onTap: () => playYoutubeVideo(3),
        child: Padding(
          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
          child: Card(
              color:Colors.red,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child:Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      // Image.asset("assets/images/food.jpg",
                      //   height: 10,
                      //   width: 10,
                      // ),
                      Text(" Alert! 359009",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),)
                    ],
                  ),
                  SizedBox(height:5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(" There is warm food in your vicinity..",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                      ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Text(" 36 secs ago",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),),
                      SizedBox(width: MediaQuery.of(context).size.width/10,),
                      RaisedButton(
                                  color: Colors.red,
                                  elevation: 0,
                                  onPressed: () => {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                Text("Food at marriage"),
                                            content: Text(
                                                "G-5, Solaris The Address, Surat - Dumas Rd, opposite Big Bazaar, Piplod, Surat, Gujarat 395007"),
                                          );
                                        }),
                                  },
                                  child: Text(
                                    "Read More..",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                    ],
                  ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 128.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(context, index);
            },
          ),
        ),
      ],
    );
  }
}
