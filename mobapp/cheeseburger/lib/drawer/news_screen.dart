import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Breifing',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
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
                        children: <Widget>[
                          Text("Uganda Crisis: Cash Hoard \nFound at al-Bashir's Home",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                          Image.asset("assets/images/newsCard.jpg",
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
                          ),)
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
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
                          children: <Widget>[
                            Text("Uganda Crisis: Cash Hoard \nFound at al-Bashir's Home",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            Image.asset("assets/images/newsCard.jpg",
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
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                          children: <Widget>[
                            Text("Uganda Crisis: Cash Hoard \nFound at al-Bashir's Home",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            Image.asset("assets/images/newsCard.jpg",
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
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                          children: <Widget>[
                            Text("Uganda Crisis: Cash Hoard \nFound at al-Bashir's Home",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            Image.asset("assets/images/newsCard.jpg",
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
                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
