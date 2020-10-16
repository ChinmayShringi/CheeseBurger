import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  @override
  _PendingScreenState createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Pending',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
      body:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 200,),
                Icon(Icons.outlined_flag,size: 90,),
                Text('Under Construction',style: TextStyle(
                  fontSize: 40
                ),)
              ],
            )
          ],
        ),
      ),

    );
  }
}
