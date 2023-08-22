import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Users.dart';
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
    userTable.createDatebaseAndTable();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode _textFocusNode = FocusNode();


  // void navigateToAdmin(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Admin()),
  //   );
  // }
  void navigateToUsers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Users()),
    );
  }
  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
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
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 300,child: TextFormField(obscureText: true,controller: fullNameController,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),filled: true, fillColor: Color(0xffeeeeee),hintText: 'Full Name'),))
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width: 300,child: TextFormField(obscureText: true,controller: typeController,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),filled: true, fillColor: Color(0xffeeeeee),hintText: 'Type'),))
                ],),
              ],)),

              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                MaterialButton(onPressed: () async {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  String fullName = fullNameController.text;
                  String type = typeController.text;
                  userTable.insert(username,password, fullName, type);
                  if(type == 'admin'){
                    // navigateToAdmin(context);
                  }
                  else{
                    justUser = await userTable.showDataById(userTable.db, username, password);
                    print(justUser);
                    navigateToUsers(context);
                  }

                },color: Color.fromARGB(255,238,238,238),child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255,54,0,255)),),),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    navigateToLogin(context);
                  },
                  child: Text('Cancel',style: TextStyle(
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

