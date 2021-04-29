import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCard createState() => _NewsCard();
}

class _NewsCard extends State<NewsCard> with SingleTickerProviderStateMixin {
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
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child:Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Image.asset("assets/images/news.png",
                        height: 10,
                        width: 10,
                      ),
                      Text(" BBC News - Uganda",style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                      ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Goverment has announced \n\$20Cr rel..",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                      ),
                      Image.asset("assets/images/news.jpg",
                        height: 80,
                        width: 120,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Text(" 1 days ago",style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                      ),),
                      SizedBox(width: MediaQuery.of(context).size.width/10,),
                      RaisedButton(
                                  color: Colors.white,
                                  elevation: 0,
                                  onPressed: () => {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                Text("Goverment Announcement!"),
                                            content: Text(
                                                "Farmers in the southern region of Uganda will get \$2 lakh each."),
                                          );
                                        }),
                                  },
                                  child: Text(
                                    "Read More..",
                                    style: TextStyle(color: Colors.black54),
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
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  width: double.maxFinite, // set width to maxFinite
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "LATEST NEWS",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        height: 30,
                      )
                    ],
                  )),
            ),
          ],
        ),
        Container(
          height: 190.0,
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
