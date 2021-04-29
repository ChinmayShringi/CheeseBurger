import 'package:flutter/material.dart';
import 'package:cheeseburger/models/functions_model.dart';

class InstituteAddress extends  StatelessWidget{
  final int id;
  List temp;
  InstituteAddress({Key key, @required this.id}) : super(key: key);
  _buildCartProduct(Map<String, dynamic> instituteAdd) {
    return Card(
        child:ListTile(
      leading: Icon(Icons.location_on,
        size: 50,
        color:Colors.black54,),
      title: Text(
        "${instituteAdd["location"]["name"]}",
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${instituteAdd["location"]["zipcode"]}",
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        "${instituteAdd["address"]["lineA"]}",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    );
  }
  Future<List> fetchPost() async {
    if(temp==null) {
      temp= await getaddressbyid(this.id);
  }
  return temp;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  Scaffold(
            backgroundColor: Colors.white,
            body: ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCartProduct(snapshot.data[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[300],
                );
              },
            ),
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
        return Column();
      },
    );
  }
}