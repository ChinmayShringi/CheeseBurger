import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/product_screen.dart';
import 'package:flutter/material.dart';

class PurchasingRoutingScreen extends StatefulWidget {
  final int index;
  @override
  PurchasingRoutingScreen({Key key,@required this.index}): super(key:key);
  _PurchasingRoutingScreenState createState() => _PurchasingRoutingScreenState();
}

class _PurchasingRoutingScreenState extends State<PurchasingRoutingScreen> with SingleTickerProviderStateMixin {
  Future<String> goods;
  @override
  void initState(){
    goods=getProdById(this.widget.index);
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
          return Scaffold(
            body:FutureBuilder<String>(
              future: goods,
              builder: (context, snapshot)
          {
            if (snapshot.hasData) {
              return ProductScreen(product: snapshot.data,);
            }else{
              return Container();
            }
          }
      )
          );
        }
}
