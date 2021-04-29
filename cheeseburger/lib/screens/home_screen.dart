import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cheeseburger/tabs/homepage_home_tab.dart';
import 'package:cheeseburger/tabs/homepage_profile_tab.dart';
import 'package:cheeseburger/tabs/homepage_search_tab.dart';

class HomeScreen extends StatefulWidget {
  final List goods;
  @override
  HomeScreen({Key key,@required this.goods}): super(key:key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }
    Widget build(BuildContext context) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomePage(),
              StreamBuilder(
                stream: Firestore.instance.collection('product').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return new Text('Loading...');
                  return HomeSearch(goods: snapshot.data.documents);
                }
              ),
                HomeProfile()
              ],
              controller: controller,
            ),
            bottomNavigationBar: Material(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.black54,
                labelColor: Colors.black54,
                unselectedLabelColor: Colors.grey,
                tabs: <Tab>[
                  Tab(
                    // set icon to the tab
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                  ),
//                  Tab(
//                    icon: Icon(Icons.pets),
//                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                ],
                // setup the controller
                controller: controller,
              ),
            ),
          );
        }
}
