import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}


    //   home: FutureBuilder(
    //     // Initialize FlutterFire
    //     future: Firebase.initializeApp(),
    // builder: (context, snapshot) {
    //   // Check for errors
    //   if (snapshot.hasError) {
    //     return const Text('something went wrong');
    //   }
    //   if (snapshot.connectionState == ConnectionState.done) {
    //     return StreamBuilder(
    //       stream: Firestore.instance.collection('basket').snapshots(),
    //       builder: (context, snapshot) {
    //         if (!snapshot.hasData) return const Text('loading');
    //         return ListView.builder(
    //             itemExtent: 80.0,
    //             itemCount: snapshot.data.documents.length,
    //             itemBuilder: (context, index) =>
    //                 _buildListItem(context, snapshot.data.documents[index]),
    //         );
    //       },
    //     );
    //   }

class _MyAppState extends State<MyApp> {
  // Future<List> goods;
  // Future<Post> post;
  @override
  void initState() {
    // super.initState();
    // goods=getallprod();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'CheeseBurger',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(FirebaseAuth.instance.currentUser);
                return StreamBuilder(
                        stream: Firestore.instance.collection('basket').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return const Text('loading');
                          return HomeScreen(goods: snapshot.data.documents);
                        }
                );
              } else if (snapshot.hasError) {
                return AlertDialog(
                  title: Text('Error!'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("Please Check Your Network Connection!"),
                        Text("${snapshot.error}"),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {},
                    ),
                  ],
                );
              }
              return Column(
                children: <Widget>[
                  SizedBox(height: 200,),
                  SizedBox(height: 200,),
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
