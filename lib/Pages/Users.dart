import 'package:datachat/Theme/Txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Database/DataBase.dart';
import '../Theme/Color.dart';
import '../Widget/UsedFunctions.dart';
import '../Widget/infoCards.dart';
import 'Login.dart';


class Users extends StatefulWidget{
  @override
  _Users createState() => _Users();
}
class _Users extends State<Users> {
  //////////////////////////////////////////////////////////////////////////////

  UserTable userTable = UserTable();
  void initState() {
    super.initState();
    userTable.createDatebaseAndTable();
  }

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String username = '', password = '';

  //////////////////////////////////////////////////////////////////////////////
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: White,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(margin: EdgeInsets.only(top: 60),alignment: Alignment.topLeft,
                  child: IntrinsicWidth(
                    child: Container(padding: EdgeInsets.fromLTRB(10,10,20,10),decoration: BoxDecoration(color: Primary,borderRadius: BorderRadius.horizontal(right: Radius.circular(10))),
                      child: Row(
                        children: [
                          CircleAvatar(child: Icon(CupertinoIcons.person_fill,color: Primary,size: 25,),backgroundColor: White),
                          SizedBox(width: 10,),
                          AdminTitleW('${justUser[0]['type']}'.toUpperCase())
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 350,width: 400,
                        decoration: BoxDecoration(
                          color: Primary,borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListView(padding: EdgeInsets.fromLTRB(40,140,40,0),children: [
              Container(
                margin: EdgeInsets.all(25),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Transparent3,),
                    width: 200,height: 200,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Primary,
                      borderRadius: BorderRadius.circular(100),
                    ), width: 175,height: 175,child: Icon(IconChecker('${justUser[0]['type']}'),color: Colors.white,size: 100,),
                  ),  //
                ],alignment: Alignment.center,),
              ),
              infoCards(Icons.mouse_rounded,'Username','${justUser[0]['username']}'),
              infoCards(Icons.password_rounded,'Password','${justUser[0]['password']}'),
              infoCards(CupertinoIcons.number_circle_fill,'ID Number','${justUser[0]['id']}'),
              infoCards(CupertinoIcons.person_fill,'Full Name','${justUser[0]['fullName']}'),
            ],)
          ],
        ),
      ),
    );
  }
}
