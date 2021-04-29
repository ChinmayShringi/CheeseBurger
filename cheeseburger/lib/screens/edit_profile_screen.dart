import 'dart:convert';

import 'package:cheeseburger/models/functions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPage extends StatefulWidget {
  @override
  State createState() => new EditPageState();
}

class EditPageState extends State<EditPage>
    with SingleTickerProviderStateMixin {
  Future<String> user;
  TextEditingController id = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController type = TextEditingController();
  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }
  @override
  void dispose() {
    id.dispose();
    contact.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:FutureBuilder<String>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.name.text=jsonDecode(snapshot.data)["user"]["name"];
            this.id.text=jsonDecode(snapshot.data)["user"]["email"];
            this.contact.text=jsonDecode(snapshot.data)["user"]["contactNumber"].toString();
            return Stack(
                fit: StackFit.expand, children: <Widget>[
              new Theme(
                data: new ThemeData(
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle:
                      new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
                    )),
                isMaterialAppTheme: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Form(
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              controller: this.name,

                              decoration: new InputDecoration(
                                  labelText: "Enter Your Name",
                                  labelStyle: TextStyle(color: Colors.black54),
                                  ),
                              keyboardType: TextInputType.text,
                            ),
                            new TextFormField(
                              controller: this.id,
                              decoration: new InputDecoration(
                                  labelText: "Enter Your Email ID",
                                  labelStyle: TextStyle(color: Colors.black54),
                                  ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              controller: this.contact,
                              decoration: new InputDecoration(
                                labelText: "Enter Contact",
                                labelStyle: TextStyle(color: Colors.black54),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.green,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(height: 20,),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.green,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]);
          }else{
            return Container();
          }
        }
      )
    );
  }
}
