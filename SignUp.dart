import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_training/Files/Flutter%201/Menu.dart';
import '5_ChatApp.dart';
import 'Database.dart';
import 'Login.dart';


class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {

  UserTable userTable=UserTable();
  void initState() {
    super.initState();
    userTable.createDBandTable();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode _textFocusNode = FocusNode();


  void navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => chatApp()),
    );
  }
  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
  void navigateToSign(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sign()),
    );
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child: Scaffold(
            appBar: AppBar(shadowColor: Color.fromARGB(255,54,0,255),backgroundColor: Color.fromARGB(255,54,0,255),shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),title: Text('Sign Up'),),
            backgroundColor: Color.fromARGB(255,54,0,255),
            body:Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
              Expanded(
                flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Icon(CupertinoIcons.person_crop_circle_badge_plus,color: Color(0xffeeeeee),size: 80,)
                ],),
              ),
              Expanded(flex:2,child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 300,child: TextFormField(controller: usernameController,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),filled: true, fillColor: Color(0xffeeeeee),hintText: 'Username'),))
                ],),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 300,child: TextFormField(obscureText: true,controller: passwordController,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),filled: true, fillColor: Color(0xffeeeeee),hintText: 'Password'),))
                ],),
              ],)),
              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                MaterialButton(onPressed: (){
                  String username = usernameController.text;
                  String password = passwordController.text;
                  userTable.insertData(username,password);
                },color: Color.fromARGB(255,238,238,238),child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255,54,0,255)),),),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    navigateToLogin(context);
                  },
                  child: Text('Log In',style: TextStyle(
                    color: Color.fromARGB(255,238,238,238),
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],))
            ],)
        ),
      ),
    );
  }
}

