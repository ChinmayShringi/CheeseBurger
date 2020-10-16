import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  children: <Widget>[
                    Center(
                      child: Row(
                          children: [
                            SizedBox(width: 20,),
                        CircularProgressIndicator(),
                            SizedBox(width: 20,),
                            Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}

class Institute {
  String imageUrl;
  String name;
  String price;
  String num;
  int rate;

  Institute({
    this.imageUrl,
    this.name,
    this.price,
    this.num,
    this.rate,
  });
}

class User {
  int id;
  String name;
  String type;
  String email;
  int contactNumber;
  bool accountRegistered;
  bool emailVerified;
  int createTime;
  int lastUpdateTime;
  User(
      {this.id,
      this.name,
      this.type,
      this.email,
      this.contactNumber,
      this.accountRegistered,
      this.emailVerified,
      this.createTime,
      this.lastUpdateTime});
}

//class Institutes {
//  String shortName,longName,email,address;
//  int rate,contactNumber,contactNumberAlt,locationId, logoImageId,strength;
//
//  Institutes({
//    this.shortName,
//    this.longName,
//    this.email,
//    this.address,
//    this.rate,
//    this.contactNumber,
//    this.contactNumberAlt,
//    this.locationId,
//    this. logoImageId,
//    this.strength,
//  });
//}

final List<Institute> institutes = [
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Resonance',
    price: 'RD',
    num: '22',
    rate: 4,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Allen',
    price: 'ALD',
    num: '23',
    rate: 3,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Akash',
    price: 'AD',
    num: '24',
    rate: 2,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Vision',
    price: 'V',
    num: '24',
    rate: 3,
  ),
];

final List<Institute> instituteList = [
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Vidyaman',
    price: 'VD',
    num: '25',
    rate: 1,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'ABC',
    price: 'HD',
    num: '26',
    rate: 4,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Ganshyam',
    price: 'GD',
    num: '27',
    rate: 4,
  ),
  Institute(
    imageUrl: 'assets/images/1.jpg',
    name: 'Balaji',
    price: 'BJ',
    num: '27',
    rate: 2,
  ),
];

final List<Institute> cart = [
  institutes[0],
  institutes[1],
  institutes[2],
  instituteList[0],
];
