import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String displayName;
  final String email;
  final String photoURL;
  final String uid;

  Users({
    this.displayName,
    this.email,
    this.photoURL,
    this.uid,
  });

  // Add the document ID to the post model when serialising.
  Users fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Users(
      displayName: map['displayName'],
      photoURL: map['photoURL'],
      email: map['email'],
      uid: map['uid'],
    );
  }
}

class FirestoreService {
  final CollectionReference _postsCollectionReference = Firestore.instance.collection('users');

  Future addCart (usr) async {
   // final String uid=FirebaseAuth.instance.currentUser.uid;
    try {
      await Firestore.instance.collection('basket').add({
        'name': usr['name'],
        'price': usr['price'],
        'quantity': usr['quantity'],
        // 'uid': uid,
        'sid': usr['sid'],
      });
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future addUser(usr) async {
    Users user;
    user.fromMap(usr);
    try {
      await _postsCollectionReference.add({
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'email': user.email,
        'uid': user.uid,
      });
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}