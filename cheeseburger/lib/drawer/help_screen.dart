import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Help',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
      child:Container(
          child:Wrap(
            children: <Widget>[
               Column(
                  children: <Widget>[
                    Center(
                      child: Text("We are here to help.",style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search AppAggroUg help',
                          labelText: 'Search'
                      ),
                    ),
                    SizedBox(height: 20,),
                     Align(
                       alignment: Alignment.topLeft,
                       child: Text("Browse help topics:",style: TextStyle(
                         fontSize: 20,
                       ),),
                     ),
                    new ListTile(
                      leading: Icon(Icons.person_outline),
                      title: new Text('Your Account'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: new Text('Business Help'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.error_outline),
                      title: new Text('Safety Standatds'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.question_answer),
                      title: new Text('FAQ'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.people),
                      title: new Text('Legal Help'),
                    ),
                    new ListTile(
                      leading: Icon(Icons.call),
                      title: new Text('Contact US'),
                    ),
                  ],
                ),
            ],
          )
      ),
      ),
    );
  }
}
