import 'dart:convert';
import 'package:cheeseburger/drawer/news_screen.dart';
import 'package:cheeseburger/drawer/tutorial_screen%20.dart';
import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/pending_screen%20.dart';
import 'package:cheeseburger/widgets/alert_card.dart';
import 'package:cheeseburger/widgets/goods_card.dart';
import 'package:cheeseburger/widgets/news_card.dart';
import 'package:cheeseburger/widgets/weather_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cheeseburger/drawer/contact_screen.dart';
import 'package:cheeseburger/screens/login_screen.dart';
import 'package:cheeseburger/drawer/help_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageHome createState() => _HomePageHome();
}

class _HomePageHome extends State<HomePage>
    with SingleTickerProviderStateMixin {
  LoginPage log;
  Future<List> post;
  List institute;
  List title=["Grab some food","Get Latest News","Contact Us Anytime"];
  Future<String> user;
  final List<String> map = [
    'assets/images/c3.jpg',
    'assets/images/c1.jpg',
    'assets/images/c2.jpg'
  ];
  @override
  void initState() {
    super.initState();
    log = LoginPage(this.callback);
    post = getallprod();
    user = fetchUser();
    super.initState();
  }

  void callback() {
    setState(() {
      this.user = fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "CheeseBurger",
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder<String>(
              future: user,
              builder: (context, snapshot) {
                return ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        AlertCard(),
                        Container(
                          height: 200.0,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    image: DecorationImage(
                                      image: AssetImage(map[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 140,left: 10),
                                    child: Text("${title[index]}",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28
                                  ),),
                                  ),
                                ),
                              );
                            },
                            itemCount: 3,
                            autoplay: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    GoodsCard(),
                    NewsCard(),
                    WeatherCard(),
                  ],
                );
              }),
          drawer: FutureBuilder<String>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          child: DrawerHeader(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color:
                                                Colors.black54.withOpacity(0.3),
                                            offset: Offset(2.0, 4.0),
                                            blurRadius: 2),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(60.0)),
                                      child:FirebaseAuth.instance.currentUser!=null ? Image.network(FirebaseAuth.instance.currentUser.photoURL,fit: BoxFit.fill,):
                                      Image.asset(
                                        "assets/images/profile.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  snapshot.data == 'Error'
                                      ? Text(
                                    FirebaseAuth.instance.currentUser!=null?'\n'+FirebaseAuth.instance.currentUser.displayName:'\nGuest User',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          '\n${jsonDecode(snapshot.data)["user"]["name"]}',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                ]),
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.video_library),
                          title: Text(
                            'Tutorials',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TutorialScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.receipt),
                          title: Text(
                            'News',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NewsScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/images/supportIcon.png',
                                color: Colors.black54),
                          ),
                          title: Text(
                            'Help',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HelpScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text(
                            'Contact US',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ContactScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text(
                            'Share the app',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black54.withOpacity(0.6),
                        ),
                        snapshot.data == 'Error'
                            ? Column(
                                children: <Widget>[
                                  ListTile(
                                    title: new Text(
                                      "Log In",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    trailing: new Icon(
                                      Icons.power_settings_new,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        user = fetchUser();
                                      });
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              LoginPage(this.callback),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.bottom,
                                  )
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  ListTile(
                                    title: new Text(
                                      "Log Out",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    trailing: new Icon(
                                      Icons.power_settings_new,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      writeContent('Error', 2);
                                      setState(() {
                                        user = fetchUser();
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.bottom,
                                  )
                                ],
                              ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("snapshot.error");
                } else {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }
              }));
    }
}
