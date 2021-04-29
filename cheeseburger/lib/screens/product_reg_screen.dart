import 'package:cheeseburger/models/functions_model.dart';
import 'package:cheeseburger/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

String data;

class ProductPage extends StatefulWidget {
  @override
  State createState() => new ProductPageState();
}

class ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  var _image;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  final price = TextEditingController();
  final name = TextEditingController();
  @override
  void dispose() {
    price.dispose();
    name.dispose();
    dropdownValue = 'Vegetable';
    super.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  int a;
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      setState(() {
        a=1;
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
  @override
  void initState(){
    a=-1;
    super.initState();
  }
  String dropdownValue = 'Vegetable';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Theme(
          data: new ThemeData(
              inputDecorationTheme: new InputDecorationTheme(
            labelStyle: new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
          )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Product Registeration",
                style: TextStyle(fontSize: 18),
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  key:_formKey,
                  autovalidate: _autoValidate,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        controller: this.name,
                        validator: (String arg) {
                        if(arg.length < 3)
                          return 'Name must be more than 3 charater';
                        else
                          return null;
                      },
                        decoration: new InputDecoration(
                            labelText: "Product Name",
                            labelStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.black),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        controller: this.price,
                        decoration: new InputDecoration(
                            labelText: "Product Price (per kg)",
                            labelStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.black),
                        keyboardType: TextInputType.number,
                      ),
//                      new TextFormField(
//                        controller: this.pass,
//                        decoration: new InputDecoration(
//                          labelText: "Your Address",labelStyle: TextStyle(
//                            color:Colors.black
//                        ),
//                        ),
//                        obscureText: true,
//                        keyboardType: TextInputType.text,
//                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton<String>(
                          hint: Text("Type of Customer"),
                          value: dropdownValue,
//                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Vegetable',
                            'Fruit',
                            'Pestisides & Insectisides',
                            'Machines',
                            'Services'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
//                              color: Colors.black87
                                    ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.black,
                        child: Text(
                          'Image Of Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          getImage().then((value) => {
                            if(_image!=null){
                              Dialogs.showLoadingDialog(context, _keyLoader),
                              uploadPhoto(_image).then((value) =>
                              {
                                setState(() {
                                  data = value;
                                }),
                                Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop(),
                              })
                            }
                              });
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.black,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _validateInputs();
                          if(data==null){
                            showDialog(
                                context: context,
                                builder:
                                    (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "No Image Found!",
                                      textAlign: TextAlign.center,),
                                    content: Text(
                                      "Please upload an image for your product!",
                                      textAlign: TextAlign.center,),
                                  );
                                });
                          } else if(a==1) {
                            Dialogs.showLoadingDialog(context, _keyLoader);
                            // registerprod(
                            //     this.name.value.text, this.price.value.text,
                            //      this.dropdownValue, data)
                            //     .then((value) =>
                            // {
                            //   if(value == 1){
                            //     Navigator.of(_keyLoader.currentContext,
                            //         rootNavigator: true).pop(),
                            //     Navigator.pop(context),
                            //     showDialog(
                            //         context: context,
                            //         builder:
                            //             (BuildContext context) {
                            //           return AlertDialog(
                            //             title: Text(
                            //               "Product Registered!",
                            //               textAlign: TextAlign.center,),
                            //             content: Text(
                            //               "Thank You! Four using our services",
                            //               textAlign: TextAlign.center,),
                            //           );
                            //         }),
                            //   } else
                            //     {
                            //       print("Error!"),
                            //       Navigator.of(_keyLoader.currentContext,
                            //           rootNavigator: true).pop(),
                            //     }
                            // });
                            Navigator.of(
                                _keyLoader.currentContext, rootNavigator: true)
                                .pop();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
