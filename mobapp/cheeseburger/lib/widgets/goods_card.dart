import 'package:cheeseburger/routing/category_routing.dart';
import 'package:flutter/material.dart';

class GoodsCard extends StatefulWidget {
  @override
  _GoodsCard createState() => _GoodsCard();
}

class _GoodsCard extends State<GoodsCard> with SingleTickerProviderStateMixin {
  double elevation=0;
  List title=['\nWarm Food', '\nRaw\nMaterial','\nFood \nin your\nvicinity','\nMACHINERY','\nSERVICES'];
  List img=['vegetable.png', 'fruit.png','chem.png','mach.png','farmer.png'];
//  List color=[[Colors.green,Colors.lightGreenAccent],[Colors.redAccent,Color.fromRGBO(255, 187, 215,1),],[Colors.deepOrangeAccent,Colors.orangeAccent],[Colors.blueAccent,Colors.lightBlueAccent],[Colors.purple,Colors.purpleAccent]];
  int index;
  @override
  void initState()
  {
    elevation=0;
    super.initState();
  }
  _buildProductCard(context,int index) {
    return Container(
      width: 135,
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
          });
          if(flag==1){
            subscription.cancel();
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryRoutingScreen(index:index)
            ),
          );
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
//                gradient: LinearGradient(
//                    begin: Alignment.bottomRight,
//                    end: Alignment.topLeft,
//                    stops: [
//                      0.5,
//                      0.999
//                    ],
//                    colors: color[index]),
                    ),
              child:Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15,),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/${img[index]}',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container (
                          width: 120,
                          child: new Column (
                            children: <Widget>[
                              Text(title[index],
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
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
                      Text("BUY GOODS",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(context,index);
            },
          ),
        ),
      ],
    );
  }
}
