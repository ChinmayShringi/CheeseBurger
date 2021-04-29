import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  @override
  _WeatherCard createState() => _WeatherCard();
}

class _WeatherCard extends State<WeatherCard> with SingleTickerProviderStateMixin {
  double elevation=0;
  int index;
  @override
  void initState()
  {
    elevation=0;
    super.initState();
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
//      pageBuilder: (context, animation, secondaryAnimation) => InstituteScreen(institute: this.institutes[index]),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 1);
        var end = Offset.zero;
        var curve = Curves.decelerate;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  _buildProductCard(context,int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:  GestureDetector(
        onTap: () {
          setState(() {
            this.index=index;
            elevation=5.0;
          });
          int flag=0;
          var future = new Future.delayed(const Duration(milliseconds: 100));
          var subscription = future.asStream().listen((val){
            setState(() {
              elevation=0;
              flag=1;
            });
//            Navigator.of(context).push(_createRoute(index));
          });
          if(flag==1){
            subscription.cancel();
          }
        },
        child:Container(
          child:Card(
//            color: Colors.lightBlueAccent,
            elevation: index==this.index?this.elevation:0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0) //         <--- border radius here
            ),
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [
                      0,
//                      0.4,
//                      0.6,
                      0.999
                    ],
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlueAccent
                    ]),),
              child:Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15,),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Image.asset('assets/images/weather.png',
                          height: 50,
                          width: 50,
                        ),
                        Text("Cloudy Day!",
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container (
                          width: MediaQuery.of(context).size.width/1.5,
                          child: new Column (
                            children: <Widget>[
                              Text("Best weather to help someone out!!",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )

//                IconTheme(
//                    data: IconThemeData(
//                      color: Colors.amber,
//                      size: 20,
//                    ),
//                    child: StarDisplay(value: 3),
//                  ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(left: 20,right: 20),
              child: SizedBox(
                  width: double.maxFinite, // set width to maxFinite
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Weather",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
//                      RaisedButton(
//                        elevation: 0,
//                        child: Text("SEE ALL",
//                          style: TextStyle(
//                            color: Colors.black54,
//                            fontSize: 10,
//                          ),
//                        ),
//                        color: Colors.transparent,
//                        onPressed: () {Navigator.push(
//                          context,
//                          MaterialPageRoute(
////                              builder: (_) => TabsScreen(title: title,institute: institutes,)
//                          ),
//                        );
//                        },
//                      ),
                      Container(height: 50,)
                    ],
                  )
              ),
            ),
          ],
        ),
        Container(
          height: 150.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(context,index);
            },
          ),
        ),
      ],
    );
  }
}
