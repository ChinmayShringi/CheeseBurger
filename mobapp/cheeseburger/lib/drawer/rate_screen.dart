import 'package:flutter/material.dart';

class RateScreen extends StatefulWidget {
  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
      child:Container(
          child:Column(
            children: <Widget>[
          Image(
            height: 100,
            width: 100.0,
            image: AssetImage(
             'assets/images/rate.png',
            ),
            fit: BoxFit.contain,
          ),
              SizedBox(height: 70,),
              Center(
                child: Text('Your opinion matter to us!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text('We worked hard to serve you better and would love to know how would you rate our app!',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
      ),
      ),
    );
  }
}
