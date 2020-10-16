import 'package:flutter/material.dart';
import 'package:cheeseburger/screens/institute_screen.dart';
import 'package:cheeseburger/tabs/institute_home_tab.dart';

class Preview extends StatelessWidget {
  final Map<String, dynamic> institute;

  Preview({@required this.institute,});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          height: 156.0,
          child: Image.asset(
              'assets/images/c2.jpg',
              fit: BoxFit.cover,
            ),
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              expandedHeight: 100,
              backgroundColor: Colors.transparent,
              flexibleSpace: const FlexibleSpaceBar(
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, -0.2),
                      colors: <Color>[Colors.black, Color(0x00000000)],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
            child:Material(
            type: MaterialType.transparency,
              child: Stack(
                children: <Widget>[
                    SafeArea(
                      top: false,
                      bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.only(top:35),
                          child:Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 18,bottom: 100),
                            child: Column(
                               children:<Widget>[
                                 Table(
                                  children: <TableRow>[
                                   TableRow(
                                      children: <Widget>[
                                        TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.fill,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                                        child:
                                        Image.asset('assets/images/dummy.png',
                                          height: 35,
                                          width: 35,
                                        ),
//        For image of the institute
//                                        Image.asset(
//                                          'assets/images/2.jpg',
//                                          width: 32.0,
//                                          height: 32.0,
//                                          alignment: Alignment.centerLeft,
//                                          fit: BoxFit.scaleDown,
//                                        ),
                                        ),
                                    ),
                                    TableCell(
                                      verticalAlignment: TableCellVerticalAlignment.middle,
                                      child: Text(this.institute["shortName"],style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ),
                                  ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      const SizedBox(),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                                        child: Text('Description of the institute',),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                                          child:Text('Farmer Members:'),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text("asd",style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                          child:Text('Rating:'),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Row(
                                          children:<Widget>[
                                            IconTheme(
                                            data: IconThemeData(
                                              color: Colors.amber,
                                              size: 25,
                                            ),
                                            child: StarDisplay(value: 3),
                                          ),
                                            Text("(237)")
                                          ]
                                        )
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                          child:Text('Students Yearly Passed:'),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(this.institute["shortName"],style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                                          child:Text('Farmer Members:'),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text(this.institute["shortName"],style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: <Widget>[
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child:Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                                          child:Text('Address:'),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Text('Room No.92, \nShakti Nagar\nKota,Rajesthan,',style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      ),
                                    ]
                                ),
                              ]
                            ),
                                 SizedBox(height: 10,),
                                 Text('\"The Only Thing That Seperates Us \nFrom Animanls Is Education\"',style: TextStyle(
                                   fontFamily: 'Raleway',
                                   fontStyle: FontStyle.italic,
                                   fontSize: 20.0,
                                 ),
                                 ),
                                 SizedBox(height: 20,),
                                 RaisedButton(
                                  elevation: 0,
                                  color: Colors.blueAccent,
                                  child: Text(" View Profile",style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),),
                                  onPressed: () =>Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => InstituteScreen(institute: this.institute),
                                    ),
                                  ),
                              )
                            ]
                            )
                        ),
                    ),
                   ),
                ],
              ),
             ),
            ),
          ],
        ),
      ],
    );
  }
}
