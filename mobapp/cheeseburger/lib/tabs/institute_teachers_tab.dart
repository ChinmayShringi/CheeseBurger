import 'package:flutter/material.dart';
import 'package:cheeseburger/models/functions_model.dart';

class InstituteTeachersTab extends StatefulWidget {
  final int id;
  @override
  InstituteTeachersTab({Key key, @required this.id}) : super(key: key);
  _InstituteTeachersTabState createState() => _InstituteTeachersTabState();
}

class _InstituteTeachersTabState extends State<InstituteTeachersTab> {
  List temp;
  @override
  void initState() {
    super.initState();
  }
  _buildCartProduct(String name) {
    return Card(
        child:ListTile(
      leading: Icon(Icons.person,
        size: 50,
        color:Colors.black54,),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'number',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        'subject',
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
    if(this.temp==null) {
      this.temp=await getteachersbyid(this.widget.id);
    }
    return this.temp;
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
                      return _buildCartProduct(snapshot.data[index]["name"]);
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
