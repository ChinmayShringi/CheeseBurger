import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/goods_search_screen.dart';
import 'package:flutter/material.dart';

class CategoryRoutingScreen extends StatefulWidget {
  final int index;
  @override
  CategoryRoutingScreen({Key key,@required this.index}): super(key:key);
  _CategoryRoutingScreenState createState() => _CategoryRoutingScreenState();
}

class _CategoryRoutingScreenState extends State<CategoryRoutingScreen> with SingleTickerProviderStateMixin {
  Future<List> goods;
  String data;
  @override
  void initState(){
    switch(this.widget.index){
      case 0:data='Vegetable';
      break;
      case 1: data ='Fruit';
      break;
      case 2: data ='Pestisides';
      break;
      case 3: data ='Machines';
      break;
      case 4: data ='Service';
      break;
    }
    goods=getProdByCategory(this.data);
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
          return Scaffold(
            body:FutureBuilder<List>(
              future: goods,
              builder: (context, snapshot)
          {
            if (snapshot.hasData) {
              return GoodsSearch(goods: snapshot.data,);
            }else{
              return Container();
            }
          }
      )
          );
        }
}
