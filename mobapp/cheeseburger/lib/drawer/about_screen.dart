import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
      child:Container(
          child:Wrap(
            children: <Widget>[
              Center(
                child: Text('-Vision-',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\nTo be the search engine for institutes of choice for the students and yout.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Text('\n-Mission-',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\nTo maximise the value of company and reduce the load of students.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Text('\n-Values-',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\nMake In India|Grow Economy|Promote Education ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
      ),
      ),
    );
  }
}
