import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/screens/register_screen.dart';
import 'package:cheeseburger/services/firebase.services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  final Function callback;
  LoginPage(this.callback);
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
//                                                 writeContent('$value', 2),
//                                                 this.widget.callback(),
//                                                 Navigator.pop(context),
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;

  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      onGoogleSignIn(context);
                    },
                    color: isUserSignedIn ? Colors.green : Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                isUserSignedIn ? 'You\'re logged in with Google' : 'Login with Google',
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                    )
                )
            )
        )
    );
  }
  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    }
    else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }
  FirestoreService().addUser(user);
    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              WelcomeUserWidget(user, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }
}

class WelcomeUserWidget extends StatelessWidget {

  GoogleSignIn _googleSignIn;
  User _user;

  WelcomeUserWidget(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                        child: Image.network(
                            _user.photoURL,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover
                        )
                    ),
                    SizedBox(height: 20),
                    Text('Welcome,', textAlign: TextAlign.center),
                    Text(_user.displayName, textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(height: 20),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          _googleSignIn.signOut();
                          FirebaseAuth.instance.signOut();
                          // FirebaseAuth.instance=null;
                          Navigator.pop(context, false);
                        },
                        color: Colors.redAccent,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.exit_to_app, color: Colors.white),
                                SizedBox(width: 10),
                                Text('Log out of Google', style: TextStyle(color: Colors.white))
                              ],
                            )
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}

