
import 'package:flutter/material.dart';
import 'Admin.dart';
import 'Login.dart';


class Delete extends StatefulWidget{
  @override
  _Delete createState() => _Delete();
}
class _Delete extends State<Delete> {
  @override
  void initState() {
    super.initState();
    userTable.createDatebaseAndTable();
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Delete'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.amberAccent,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
                children: [
                  Card(
                    color: Colors.amber,
                    child: ListTile(
                      title: txt(x: 'Name: ${justUser.length > 0 ? justUser[0]['username'] : 'Deleted'}', clr: Colors.black),
                    ),
                  ),
                  Card(
                    color: Colors.amber,
                    child: ListTile(
                      title: txt(x: 'password: ${justUser.length > 0 ? justUser[0]['password'] : 'Deleted'}', clr: Colors.black),
                    ),
                  ),Card(
                    color: Colors.amber,
                    child: ListTile(
                      title: txt(x: 'full name: ${justUser.length > 0 ? justUser[0]['fullName'] : 'Deleted'}', clr: Colors.black),
                    ),
                  ),Card(
                    color: Colors.amber,
                    child: ListTile(
                      title: txt(x: 'type: ${justUser.length > 0 ? justUser[0]['type'] : 'Deleted'}', clr: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            print(justUser);
                            await userTable.deleteUsername(getId);
                            justUser = await userTable.showDataByIdx(userTable.db, getId);
                            print(justUser);
                            setState(() {

                            });
                          },
                          elevation: 15,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              txt(x: 'Delete'),
                              Icon(Icons.delete),
                            ],
                          ),
                          color: Colors.amberAccent,
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      );
}

Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(
  x,
  style: TextStyle(
      color: clr,
      fontSize: sz
  ),
  textAlign: ta,
);
