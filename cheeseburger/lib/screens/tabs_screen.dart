import 'package:flutter/material.dart';
import 'package:cheeseburger/tabs/institute_home_tab.dart';
import 'package:cheeseburger/widgets/institutions_preview.dart';

class TabsScreen extends StatelessWidget {
  final String title;
  final List institute;

  TabsScreen({Key key,@required this.title,this.institute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
                backgroundColor: Colors.blueAccent,
                pinned: true,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(title,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:1,
                  childAspectRatio: 3,
                ),
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  return new GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Preview(institute: this.institute[index],),
                        ),
                      ),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                 ListTile(
                                  leading: Image.asset('assets/images/dummy.png',
                              height: 35,
                              width: 35,
                            ),
                                  title: Text(this.institute[index]["shortName"]),
                                  subtitle: Text("3"),
                                ),
                                IconTheme(
                                  data: IconThemeData(
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  child: StarDisplay(value: 3),
                                ),
                              ],
                            ),
                          ),
                  );
                },
                  childCount: this.institute.length
                ),
              ),
            ],
          ),
    );
  }
}
