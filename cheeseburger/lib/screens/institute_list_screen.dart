//import 'package:flutter/material.dart';
//import 'package:kota_factory/models/product_model.dart';
//import 'package:kota_factory/screens/institute_screen.dart';
//
//class InstituteListScreen extends StatefulWidget {
//  @override
//  _InstituteListScreenState createState() => _InstituteListScreenState();
//}
//
//class _InstituteListScreenState extends State<InstituteListScreen> {
//  _buildCartProduct(int index) {
//    return ListTile(
//      contentPadding: EdgeInsets.all(20.0),
//      leading: Image(
//        width: 100.0,
//        image: AssetImage(
//          cart[index].imageUrl,
//        ),
//        fit: BoxFit.contain,
//      ),
//      title: Text(
//        cart[index].name,
//        style: TextStyle(
//          fontSize: 16.0,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
//      subtitle: Text(
//        cart[index].name,
//        style: TextStyle(
//          fontSize: 16.0,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
//      trailing: Text(
//        '${cart[index].rate}',
//        style: TextStyle(
//          color: Colors.orange,
//          fontSize: 16.0,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
////      onTap: () {
////      // Update the state of the app.
////      Navigator.push(
////        context,
////        MaterialPageRoute(
////          builder: (_) => InstituteScreen(text:index,),
////        ),
////      );
////    },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar:PreferredSize(
//        preferredSize: Size.fromHeight(40.0),
//    child: AppBar(
//        backgroundColor: Colors.white,
//        title: Text(
//          'List of institutions  (${cart.length}+)',
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: 20.0,
//          ),
//        ),
//      ),
//    ),
//      body: ListView.separated(
//        itemCount: cart.length,
//        itemBuilder: (BuildContext context, int index) {
//          return _buildCartProduct(index);
//        },
//        separatorBuilder: (context, index) {
//          return Divider(
//            color: Colors.grey[300],
//          );
//        },
//      ),
//    );
//  }
//}
