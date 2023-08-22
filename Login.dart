import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_training/Files/Flutter%201/Menu.dart';
import '5_ChatApp.dart';
import 'Database.dart';
import 'SignUp.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {

  UserTable userTable=UserTable();
  void initState() {
    super.initState();
    userTable.createDBandTable();
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode _textFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child: Scaffold(
            appBar: AppBar(backgroundColor: Color(0xff000000),shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),title: Text('Login Page'),),
            backgroundColor: Color(0xff000000),
            body:Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
              Expanded(
                flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Icon(CupertinoIcons.person_crop_circle,color: Color(0xffeeeeee),size: 80,)
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
                MaterialButton(onPressed: ()async{
                  String username = usernameController.text;
                  String password = passwordController.text;
                  bool isLoggedIn = await userTable.checkCredentials(username, password);
                  if (isLoggedIn) {
                    navigateToHomePage(context);
                  } else {
                    print('Invalid credentials');
                  }
                  },color: Color.fromARGB(255,54,0,255),child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffeeeeee)),),),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    navigateToSign(context);
                  },
                  child: Text('Sign Up',style: TextStyle(
                    color: Color.fromARGB(255,54,0,255),
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
