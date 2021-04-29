import 'package:flutter/material.dart';
import 'package:cheeseburger/tabs/institute_address.dart';
import 'package:cheeseburger/tabs/institute_contact_tab.dart';
import 'package:cheeseburger/tabs/institute_teachers_tab.dart';
class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class InstituteHomeScreen extends  StatelessWidget{
  final Map<String, dynamic> institute;
  InstituteHomeScreen({Key key, @required this.institute}) : super(key: key);
  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/dummy.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black54,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      this.institute["shortName"],
      style: _nameTextStyle,
      overflow: TextOverflow.fade,
    );
  }
  Widget _buildSeparator() {
    return Container(
      width: 150,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0,left: 10,right: 10),
      child: Center(
        child: Text(
          " Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, both medical and surgical, of the sick and the injured; and for their housing during this process. The modern hospital also often serves as a centre for investigation and for teaching.",
          style: TextStyle(fontFamily: 'Roboto', fontSize: 15.0,color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      _buildProfileImage(),
                      SizedBox(width: 20,),
                      _buildFullName(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
//                        _buildFullName(),
                    ],
                  ),
                  _buildSeparator(),
                  SizedBox(height: 10.0),
                  _buildGetInTouch(context),
//
//                  SizedBox(height:(height -500)),
//                  Center( child: Text("Address",style: TextStyle(
//                    color: Colors.black54
//                  ),),),
//                  Container(
//                    height: 200,
//                    child:
//                    InstituteAddress(id: this.institute["id"],),
//                  ),
//                  SizedBox(height:(height -600)),
//                  Center( child: Text("Teachers",style: TextStyle(
//                      color: Colors.black54
//                  ),),),
//                  Container(
//                    height: 200,
//                    child:
//                    InstituteTeachersTab(id: this.institute["id"],),
//                  ),
//                  SizedBox(height:(height -600)),
//                  Center( child: Text("Contact",style: TextStyle(
//                      color: Colors.black54
//                  ),),),
//                  ListView(
//                    shrinkWrap: true,
//                    physics: NeverScrollableScrollPhysics(),
//                    children: <Widget>[
//                      Container(
//                        height: 200,
//                        child:
//                        InstituteContact(id: this.institute["id"]),
//                      )
//                    ],
//                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}