import 'package:flutter/material.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'FeedBack',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Container(
            child: Wrap(
              children: <Widget>[
                Center(
                  child: Text('Its Easy!\n\n',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
//              border: InputBorder.none,
                      hintText: 'Your Email ID',
                      labelText: 'Email ID'
                  ),
                ),
                SizedBox(height: 80),
                TextField(
                  maxLines: 8,
                  decoration: InputDecoration(hintText: "Enter your feed back here",
                      border: OutlineInputBorder(),
//                  border:InputBorder.none,
                      labelText: 'FeedBack'),
                ),
                Center(
                  child:RaisedButton(
                    onPressed: () {},
                    child: Text('Send FeedBack!'),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
