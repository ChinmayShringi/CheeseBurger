import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
//        backgroundColor: Colors.white,
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child:
        Padding(
          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Would you like to read the FAQ?",
            style: TextStyle(
              color: Colors.blue
            ),),
            RaisedButton(
              onPressed: () {},
              child: Text('Send FeedBack!',style: TextStyle(
                color: Colors.white
              ),),
              color: Colors.green,
            ),
          ],
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Container(
        child: Wrap(
          children: <Widget>[
            SizedBox(height: 80),
            TextField(
              decoration: InputDecoration(hintText: "Enter your feed back here",
//                  border: OutlineInputBorder(),
                  labelText: 'FeedBack'),
            ),
            Row(
              children: <Widget>[
                Text("Add Screenshot(Optional)",style: TextStyle(
                  color: Colors.green
                ),)
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width/3-15,
                height: 150,
                child:Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("+",style: TextStyle(
                                color: Colors.black54,
                                fontSize: 28
                            ),),
                            Container(
                              width: MediaQuery.of(context).size.width/3-30,
                              child:Text("Send Screenshot",style: TextStyle(
                                  fontSize: 18
                              ),
                                textAlign: TextAlign.center,),
                            ),
                          ],
                        )
                      ],
                    )
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width/3-15,
                height: 150,
                child:Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("+",style: TextStyle(
                                color: Colors.black54,
                                fontSize: 28
                            ),),
                            Container(
                              width: MediaQuery.of(context).size.width/3-30,
                              child:Text("Send Screenshot",style: TextStyle(
                                  fontSize: 18
                              ),
                                textAlign: TextAlign.center,),
                            ),
                          ],
                        )
                      ],
                    )
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width/3-15,
                height: 150,
                child:Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("+",style: TextStyle(
                                color: Colors.black54,
                                fontSize: 28
                            ),),
                            Container(
                              width: MediaQuery.of(context).size.width/3-30,
                              child:Text("Send Screenshot",style: TextStyle(
                                  fontSize: 18
                              ),
                                textAlign: TextAlign.center,),
                            ),
                          ],
                        )
                      ],
                    )
                )
            ),
          ],
        )
      ),
      ),
    );
  }
}
