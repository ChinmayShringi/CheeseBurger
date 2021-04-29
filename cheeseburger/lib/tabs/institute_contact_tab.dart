import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cheeseburger/models/functions_model.dart';

class InstituteContact extends  StatelessWidget{
  final int id;
  List temp;
  InstituteContact({Key key, @required this.id}) : super(key: key);

  Future<List> fetchPost() async {
    if(temp==null) {
      temp = await getcontactbyid(this.id);
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
                if(index == snapshot.data.length -1) {
                  return Column(
                    children: <Widget>[
                      Table(
                          columnWidths: {1: FractionColumnWidth(.8)},
                          children: <TableRow>[
                            TableRow(
                                children: <Widget>[
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      child: Icon(
                                        Icons.call, color: Colors.blue,),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Text(
                                      "${snapshot.data[index]["type"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: <Widget>[
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Text(
                                      "${snapshot.data[index]["data"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ]
                            ),
                            TableRow(
                                children: <Widget>[
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      child: Icon(Icons.mail_outline,
                                        color: Colors.blue,),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment: TableCellVerticalAlignment
                                        .middle,
                                    child: Text("farmerscare@gmail.com",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ]
                            ),
                          ]
                      ),
                    ],
                  );
                } else {
                  return Column(
                  children: <Widget>[
                    Table(
                        columnWidths: {1: FractionColumnWidth(.8)},
                        children: <TableRow>[
                          TableRow(
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment
                                      .middle,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20.0),
                                    child: Icon(
                                      Icons.call, color: Colors.blue,),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment
                                      .middle,
                                  child: Text(
                                    "${snapshot.data[index]["type"]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                ),
                              ]
                          ),
                          TableRow(
                              children: <Widget>[
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment
                                      .middle,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20.0),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment: TableCellVerticalAlignment
                                      .middle,
                                  child: Text(
                                    "${snapshot.data[index]["data"]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                ),
                              ]
                          ),
                        ]
                    ),
                  ],
                );
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black54,
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