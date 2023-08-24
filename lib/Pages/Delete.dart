import 'package:datachat/Pages/Navigation/Navigations.dart';
import 'package:datachat/Widget/infoCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Theme/Color.dart';
import '../Theme/Txt.dart';
import '../Widget/UsedFunctions.dart';
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

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                            CircleAvatar(child: Icon(CupertinoIcons.delete_solid,color: Primary,size: 25,),backgroundColor: White),
                            SizedBox(width: 10,),
                            AdminTitleW('Delete'.toUpperCase())
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
                      ), width: 175,height: 175,child: MaterialButton(onPressed: () async{
                        await userTable.deleteUsername(getId);
                        navigateToAdmin(context);
                        },shape: CircleBorder(),child: Icon((Icons.delete_forever),color: White,size: 75,)
                    ),
                    ),  //
                  ],alignment: Alignment.center,),
                ),
                infoCards(Icons.mouse_rounded,'Username','${justUser.length > 0 ? justUser[0]['username'] : 'Deleted'}'),
                infoCards(Icons.password_rounded,'Password','${justUser.length > 0 ? justUser[0]['password'] : 'Deleted'}'),
                infoCards(CupertinoIcons.number_circle_fill,'Full Name','${justUser.length > 0 ? justUser[0]['fullName'] : 'Deleted'}'),
                infoCards(CupertinoIcons.person_fill,'Type','${justUser.length > 0 ? justUser[0]['type'] : 'Deleted'}'),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}