import 'package:cheeseburger/models/functions_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegisterPage extends StatefulWidget {
  final Function callback;
  RegisterPage(this.callback);
  @override
  State createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final id = TextEditingController();
  final contact = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final pass = TextEditingController();
  @override
  void dispose() {
    id.dispose();
    contact.dispose();
    name.dispose();
    pass.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  int a;
  @override
  void initState(){
    a=-1;
    super.initState();
  }
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      setState(() {
        a=1;
      });
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/images/c1.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
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
                  key:_formKey,
                  autovalidate: _autoValidate,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        controller: this.name,
                        validator: (String arg) {
                          if(arg.length < 3)
                            return 'Name must be more than 2 charater';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                            labelText: "Enter Your Name",
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        controller: this.id,
                        validator: (String arg) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if(!regex.hasMatch(arg))
                            return 'Invalid Email';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                            labelText: "Enter Your Email ID",
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        controller: this.pass,
                        validator: (String arg) {
                          if(arg.length < 5)
                            return 'Password must be more than 5 charater';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        controller: this.contact,
                        validator: (String arg) {
                          if(arg.length !=10)
                            return 'Cntact must have 10 digits';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                          labelText: "Enter Contact",
                          labelStyle: TextStyle(color: Colors.white),
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
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _validateInputs();
                          if(this.a==1){
                            regUser(
                              this.name.value.text,
                              this.id.value.text,
                              this.pass.value.text,
                              this.contact.value.text,)
                                .then((value) =>
                            {
                              if (value == 1)
                                {
                                  Navigator.pop(context),
                                  this.widget.callback(),
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              "Registeration Successful"),
                                          content: Text(
                                              "Welcome to Our Community!"),
                                        );
                                      }),
                                }
                              else
                                {print("Error!")}
                            });
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
