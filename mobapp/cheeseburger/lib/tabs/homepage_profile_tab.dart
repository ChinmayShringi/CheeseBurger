import 'dart:convert';
import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/cart_screen.dart';
import 'package:cheeseburger/screens/login_screen.dart';
import 'package:cheeseburger/screens/product_reg_screen.dart';
import 'package:cheeseburger/widgets/profile_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfile createState() => _HomeProfile();
}

class _HomeProfile extends State<HomeProfile>
    with SingleTickerProviderStateMixin {
  String head = 'Your Profile';
  LoginPage log;
  Future<String> post;
  var _image;
  String data;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    log = LoginPage(this.callback);
    post = fetchUser();
  }

  void callback() {
    setState(() {
      this.post = fetchUser();
    });
  }

  Widget _buildProfileImage() {
    return Center(
      child: GestureDetector(
        onTap: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(
                      "Profile Photo",
                      textAlign: TextAlign.center,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () => {
                            getProfilePhoto()
                          },
                          child: Text(
                            "Remove",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () => {
                            getImage().then((value) => {
                                  if (_image != null)
                                    {
                                      uploadPhoto(_image).then((value) => {
                                            uploadProfilePhoto(value)
                                                .then((value) => {print(value)})
                                          })
                                    }
                                })
                          },
                          child: Text(
                            "Upload",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ));
              })
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FirebaseAuth.instance.currentUser!=null ? NetworkImage(FirebaseAuth.instance.currentUser.photoURL): AssetImage('assets/images/profile.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80.0),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black54,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 160,
          height: 20,
          child: Text(
            '$count',
            style: _statCountTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          label,
          style: _statLabelTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatContainer(String email, String name) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.white10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStatItem("$email", "$name"),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.dashboard),
                    title: new Text('Random Data'),
                    onTap: () => {}),
                new ListTile(
                    leading: new Icon(Icons.history),
                    title: new Text('History'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.power_settings_new),
                  title: new Text('Sign Out'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        elevation: 1,
//        backgroundColor: Colors.white,
        title: Text(
          head,
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.menu, color: Colors.white),
//            onPressed: () => _settingModalBottomSheet(context),
//          ),
//        ],
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
                child: FutureBuilder(
                    future: post,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: 40,
                              ),
                              _buildProfileImage(),
                              SizedBox(
                                height: 150,
                                width: 50,
                              ),
                              snapshot.data != 'Error'
                                  ? _buildStatContainer(
                                      jsonDecode(snapshot.data)["user"]["email"]
                                          .toString(),
                                      jsonDecode(snapshot.data)["user"]["name"]
                                          .toString())
                                  : _buildStatContainer('', FirebaseAuth.instance.currentUser!=null? FirebaseAuth.instance.currentUser.displayName:'Guest user'),
                            ],
                          ),
//                          Text('I am looking forward to live a healthy life!'),
                          SizedBox(
                            height: 20,
                          ),
//                          Divider(
//                            height: 1,
//                            color: Colors.black54.withOpacity(0.6),
//                          ),
                          FirebaseAuth.instance.currentUser!=null
                              ? ProfileCards(
                                  nav: 1, head: ['SELL\nFOOD', 'MY CART'])
                              : Container(
                                  width: 150,
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: 20, right: 20),
                                    child: ButtonTheme(
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  LoginPage(this.callback),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          snapshot.data != 'Error'
                              ? ProfileCards(
                                  nav: 2,
                                  head: ['MY\nPRODUCTS', 'EDIT\nPROFILE'])
                              : Container(),
                        ]);
                      } else if (snapshot.hasError) {
                        return Text(" ");
                      } else if (!snapshot.hasData) {
                        return Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: 40,
                              ),
                              _buildProfileImage(),
                              SizedBox(
                                height: 150,
                                width: 50,
                              ),
                              _buildStatContainer('Guest user', ' '),
                            ],
                          ),
                          Text('I am looking forward to live a healthy life!'),
                          ButtonTheme(
                            minWidth: double.maxFinite,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text('Edit Profile'),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black54.withOpacity(0.6),
                          ),
                          SizedBox(height: 40.0),
                          ButtonTheme(
                            buttonColor: Colors.greenAccent,
                            minWidth: double.maxFinite,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductPage(),
                                  ),
                                );
                              },
                              child: Text('Your Products'),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          ButtonTheme(
                            buttonColor: Colors.greenAccent,
                            minWidth: double.maxFinite,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CartScreen(),
                                  ),
                                );
                              },
                              child: Text('Your Cart'),
                            ),
                          ),
                        ]);
                      } else {
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }
}
