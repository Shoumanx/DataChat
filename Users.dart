
import 'package:flutter/material.dart';
import 'package:untitled1/DataBase.dart';
import 'package:untitled1/Login.dart';

import 'UsedFunctions.dart';
TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();
String username = '', password = '';
class Users extends StatefulWidget{
  @override
  _Users createState() => _Users();
}
class _Users extends State<Users> {
  UserTable userTable = UserTable();
  @override
  void initState() {
    super.initState();
    userTable.createDatebaseAndTable();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('User Page'),
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
                    if(justUser.isNotEmpty)
                      Card(
                        color: Colors.pink,
                        shadowColor: Colors.grey,
                        elevation: 5,
                        child: ListTile(
                          onTap: () {

                          },
                          title: txt(x: justUser[0]['username'], clr: Colors.black),
                          leading: CircleAvatar(
                            radius: 15.0,
                            child: txt(x: justUser[0]['id'].toString()),
                          ),
                          subtitle: txt(x: justUser[0]['fullName'], clr: Colors.amber),
                          trailing: txt(x: justUser[0]['password'], clr: Colors.amber),
                        ),
                      ),

                ],
            ),
          ),
        ),
      );
}



Widget feild(TextEditingController x, String hint, String label, Icon icn) => Padding(
  padding: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
  child: TextField(
    controller: x,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: hint,
        icon: icn,
        labelText: label
    ),
  ),
);
