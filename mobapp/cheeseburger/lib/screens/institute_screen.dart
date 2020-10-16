import 'package:flutter/material.dart';
import 'package:cheeseburger/tabs/institute_contact_tab.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cheeseburger/tabs/institute_address.dart';
import 'package:cheeseburger/tabs/institute_home_tab.dart';
import 'package:cheeseburger/tabs/institute_teachers_tab.dart';

class InstituteScreen extends StatelessWidget {
  final Map<String, dynamic> institute;
  final List<String> map = ['assets/images/c3.jpg','assets/images/c1.jpg','assets/images/c2.jpg'];
  InstituteScreen({Key key,@required this.institute}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.location_on)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.call))
              ],
            ),
            title: Text(this.institute["shortName"]),
          ),
          body: TabBarView(
            physics:NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child:
                    Swiper(
                      itemBuilder: (BuildContext context,int index){
                        return new Image.asset(map[index], fit: BoxFit.fill,);
                      },
                      itemCount: 3,
                      control: new SwiperControl(color: Colors.white),
                      autoplay: true,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: InstituteHomeScreen(institute: this.institute,),
                  )
                ],
              ),
              InstituteAddress(id: this.institute["id"],),
              InstituteTeachersTab(id: this.institute["id"],),
              InstituteContact(id: this.institute["id"]),
            ],
          ),
        ),
      ),
    );
  }
}
